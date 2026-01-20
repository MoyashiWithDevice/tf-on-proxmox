provider "proxmox" {
  # endpoint は variables.tf の default で決まる
  endpoint = var.endpoint

  # token は env(PROXMOX_VE_API_TOKEN) があれば provider 側が拾えるので、
  # var を使わず空でもOKにしておくのが事故りにくい
  api_token = try(var.api_token, null)

  insecure = true
}
