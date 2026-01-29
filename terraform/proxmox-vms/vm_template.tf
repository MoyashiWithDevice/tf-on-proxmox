# __generated__ by Terraform
resource "proxmox_virtual_environment_vm" "ubuntu_temp" {
  machine                              = null
  name                                 = "Ubuntu24.04-template"
  node_name                            = "proxmox-host1"
  tags                                 = ["template"]
  template                             = true
  vm_id                                = 9000
}