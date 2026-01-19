# ノード一覧を取得するだけのデータソース（VMはまだ作らない）
data "proxmox_nodes" "all" {}

output "nodes" {
  value = data.proxmox_nodes.all.names
}