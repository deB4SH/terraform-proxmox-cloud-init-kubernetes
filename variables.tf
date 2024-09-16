# proxmox vm information
variable "node_name" {
  type        = string
  description = "Node to deploy services to"
  default     = "pve"
}

# cloud init configuration
variable "user" {
  type        = string
  description = "Default user to create and run from"
  default     = "carrot"
}

variable "user_password" {
  type        = string
  sensitive   = true
  description = "Default user password to set"
  #to generate a user_password run the following command and replace password with your password
  #> echo -n password | sha256sum | awk '{printf "%s",$1 }' | sha256sum
}

variable "user_pub_key" {
  type        = string
  sensitive   = true
  description = "Public key to use for authentication."
  #to generate a new pubkey run following command
  #> ssh-keygen -t ed25519 -C "<EMAIL>"
}

variable "kubernetes_version" {
  type = string
  description = "Version of Kubernetes to deploy"
  default = "1.30"
}

# vm information
variable "vm_id" {
  type        = number
  description = "VM id to register"
  default     = 10000
}

variable "vm_name" {
  type        = string
  description = "Name of vm"
  default     = "kubernetes-controlplane"
}

variable "vm_description" {
  type        = string
  description = "Description for the vm"
  default     = "Kubernetes Controlplane"
}

variable "vm_tags" {
  description = "Tags for thee"
  type        = object({
    tags = list(string)
  })
  default = {
    tags = [ "k8s","kubernetes"]
  }
}

variable "vm_cpu_cores" {
  type        = number
  description = "Amount of cores to use"
  default     = 2
}

variable "vm_memory" {
  type        = number
  description = "Amount of dedicated memory to allocatee"
  default     = 4096
}

variable "vm_datastore_id" {
  type        = string
  description = "Datastore to use for drives"
  default     = "local-lvm"
}

variable "vm_ip_config" {
  description = "IP config for VM"
  type = object({
    address = string
    gateway = string
  })
}

variable "vm_dns" {
  description = "DNS config for VMs"
  type        = object({
    domain  = string
    servers = list(string)
  })
}

variable "workers" {
  type = list(object({
    node = string # node to run on
    name = string
    vm_cpu_cores = number
    vm_memory = number
    ip = string
    image_type = string
    id_offset = number
  }))
}

variable "vm_images" {
  type = list(object({
    name               = string
    filename           = string
    url                = string
    checksum           = string
    checksum_algorithm = string
    datastore_id       = string
  }))
  default = [ {
    name = "amd64"
    filename = "kuberneetes-debian-12-generic-amd64-20240507-1740.img"
    url = "https://cloud.debian.org/images/cloud/bookworm/20240507-1740/debian-12-generic-amd64-20240507-1740.qcow2"
    checksum = "f7ac3fb9d45cdee99b25ce41c3a0322c0555d4f82d967b57b3167fce878bde09590515052c5193a1c6d69978c9fe1683338b4d93e070b5b3d04e99be00018f25"
    checksum_algorithm = "sha512"
    datastore_id = "local"
  },
  {
    name = "arm64"
    filename = "kuberneetes-debian-12-generic-arm64-20240507-1740.img"
    url = "https://cloud.debian.org/images/cloud/bookworm/20240507-1740/debian-12-generic-arm64-20240507-1740.qcow2"
    checksum = "626a4793a747b334cf3bc1acc10a5b682ad5db41fabb491c9c7062001e5691c215b2696e02ba6dd7570652d99c71c16b5f13b694531fb1211101d64925a453b8"
    checksum_algorithm = "sha512"
    datastore_id = "local"
  }
  ]
}

variable "cloud_init_configuration_datastore_id" {
  type        = string
  description = "Datastore to use for cloud init configuration files"
  default     = "local"
}

variable "cloud_init_configuration_apt_mirror_uri" {
  type = string
  description = "Default mirror to use for download resources"
  default = "https://deb.debian.org/debian"
}

variable "cloud_init_configuration_timezone" {
  type = string
  description = "Timezone of VM"
  default = "Europe/Berlin" 
}