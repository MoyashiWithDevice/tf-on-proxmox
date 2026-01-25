data "vault_generic_secret" "github_token" {
  path = "kv/data/github" # Vault上のパスに合わせてください
}

locals {
  github_pat = data.vault_generic_secret.github_token.data["token"]
}