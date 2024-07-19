terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.53.1"
    }
    macaddress = {
      source = "ivoronin/macaddress"
      version = "0.3.2"
    }
  }
}