module "fileserver" {
  source   = "../../modules/vm-windows"
  for_each = var.fileserver_servers

  name                 = each.key
  folder               = "prod-nord/fileserver"
  resource_pool_id     = data.vsphere_compute_cluster.this[each.value.cluster].resource_pool_id
  datastore_id         = data.vsphere_datastore.this[each.value.cluster].id
  network_id           = vsphere_distributed_port_group.this["data"].id
  template_uuid        = data.vsphere_virtual_machine.template["tpl-win-2022"].id
  guest_id             = data.vsphere_virtual_machine.template["tpl-win-2022"].guest_id
  cpus                 = each.value.cpus
  memory_gb            = each.value.memory_gb
  disk_gb              = 2000
  ip                   = each.value.ip
  gateway              = var.networks["data"].gateway
  dns_servers          = var.nameservers
  domain               = var.domain
  admin_password       = data.vault_kv_secret_v2.vm_admin.data["windows_admin_password"]
  domain_join_password = data.vault_kv_secret_v2.vm_admin.data["domain_join_password"]

  tags = [
    vsphere_tag.backup["daily"].id,
    vsphere_tag.umgebung["prod"].id,
    vsphere_tag.verantwortlich["team-daten"].id,
    vsphere_tag.kostenstelle["4300"].id,
  ]
}
