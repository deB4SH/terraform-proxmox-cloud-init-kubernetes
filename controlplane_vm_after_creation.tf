######
# Kubernates replated commands
# - steps:
# -- 1) write vm ip to disk
# -- 2) sleep a bit and wait for kubernetes to come online
# -- 3) extract kubeconf and write to disk
# -- 4) kubeadm token create
#####

#Step 1: write ip for backup reasons to disk (required for step 3 and 4)
output "ctrl_ipv4_address" {
  depends_on = [proxmox_virtual_environment_vm.k8s-ctrl]
  value      = proxmox_virtual_environment_vm.k8s-ctrl.ipv4_addresses[1][0]
}
resource "local_file" "ctrl-ip" {
  content         = proxmox_virtual_environment_vm.k8s-ctrl.ipv4_addresses[1][0]
  filename        = "output/ctrl-ip.txt"
  file_permission = "0644"
}

#Step 2: wait for service to be running
module "sleep" {
  depends_on   = [local_file.ctrl-ip]
  source       = "Invicton-Labs/shell-data/external"
  version      = "0.4.2"
  command_unix = "sleep 30"
}

#Step 3: Write kubeconf to disk
module "kube-config" {
  depends_on   = [module.sleep]
  source       = "Invicton-Labs/shell-resource/external"
  version      = "0.4.1"
  command_unix = "ssh -o UserKnownHostsFile=/tmp/control_plane_known_host -o StrictHostKeyChecking=no ${var.user}@${local_file.ctrl-ip.content} cat /home/${var.user}/.kube/config"
}

resource "local_file" "kube-config" {
  content         = module.kube-config.stdout
  filename        = "output/config"
  file_permission = "0600"
}

#Step 4: kubeadm token
module "kubeadm-join" {
  depends_on   = [local_file.kube-config]
  source       = "Invicton-Labs/shell-resource/external"
  version      = "0.4.1"
  command_unix = "ssh -o StrictHostKeyChecking=no ${var.user}@${local_file.ctrl-ip.content} /usr/bin/kubeadm token create --print-join-command"
}