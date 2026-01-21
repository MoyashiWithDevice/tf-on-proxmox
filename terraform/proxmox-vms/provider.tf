terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.50"
    }
  }
}

provider "proxmox" {
  # endpoint / api_token は env (PROXMOX_VE_ENDPOINT / PROXMOX_VE_API_TOKEN) から読む
  insecure = true
}
