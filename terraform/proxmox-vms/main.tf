# terraform/proxmox-vms/main.tf
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.50"
    }
  }
}

resource "proxmox_vm_qemu" "web_server" {
  count       = 1
  name        = "Ubuntu24-${count.index}"
  node_name = var.target_node # Proxmoxのノード名

  clone{
    vm_id = var.template_vmid
  }
  cpu{
    cores = 2
  }
  memory{
    dedicated = 2048
  }

  network {
    bridge = var.bridge
  }

  # Cloud-init設定（IP固定やSSHキーなど）
  os_type = "cloud-init"
  ipconfig0 = "ip=172.31.0.13${count.index}/24,gw=172.31.0.254"
}