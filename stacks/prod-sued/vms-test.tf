module "test" {
  source   = "../../modules/vm-linux"
  for_each = var.test_servers

  name             = each.key
  folder           = "prod-sued/test"
  resource_pool_id = data.vsphere_compute_cluster.this[each.value.cluster].resource_pool_id
  datastore_id     = data.vsphere_datastore.this[each.value.cluster].id
  network_id       = vsphere_distributed_port_group.this["backend"].id
  template_uuid    = data.vsphere_virtual_machine.template["tpl-ubuntu-1804"].id
  guest_id         = data.vsphere_virtual_machine.template["tpl-ubuntu-1804"].guest_id
  cpus             = each.value.cpus
  memory_gb        = each.value.memory_gb
  disk_gb          = 60
  ip               = each.value.ip
  gateway          = var.networks["backend"].gateway
  dns_servers      = var.nameservers
  domain           = var.domain
  root_password    = data.vault_kv_secret_v2.vm_admin.data["linux_root_password"]

  tags = [
    vsphere_tag.umgebung["test"].id,
  ]
}
