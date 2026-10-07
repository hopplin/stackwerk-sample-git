data "vault_kv_secret_v2" "vm_admin" {
  mount = "infra"
  name  = "prod-nord/vm-admin"
}
