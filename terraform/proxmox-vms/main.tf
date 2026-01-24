# terraform/proxmox-vms/main.tf
resource "proxmox_virtual_environment_vm" "web_server" {
  count       = 1
  name        = "terraform-test"
  vm_id = 108
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

  network_device {
    model = "virtio"
    bridge = var.bridge
  }

  initialization {
    interface = "ide2"
    ip_config{
      ipv4{
        address = "172.31.0.13${count.index}/24"
        gateway = "172.31.0.254"
      }
    }
  }
}
