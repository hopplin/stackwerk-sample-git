module "jump" {
  source   = "../../modules/vm-windows"
  for_each = var.jump_servers

  name                 = each.key
  folder               = "dmz/jump"
  resource_pool_id     = data.vsphere_compute_cluster.this[each.value.cluster].resource_pool_id
  datastore_id         = data.vsphere_datastore.this[each.value.cluster].id
  network_id           = vsphere_distributed_port_group.this["mgmt"].id
  template_uuid        = data.vsphere_virtual_machine.template["tpl-win-2022"].id
  guest_id             = data.vsphere_virtual_machine.template["tpl-win-2022"].guest_id
  cpus                 = each.value.cpus
  memory_gb            = each.value.memory_gb
  disk_gb              = 60
  ip                   = each.value.ip
  gateway              = var.networks["mgmt"].gateway
  dns_servers          = var.nameservers
  domain               = var.domain
  admin_password       = var.windows_admin_password
  domain_join_password = var.domain_join_password

  tags = [
    vsphere_tag.umgebung["dmz"].id,
    vsphere_tag.verantwortlich["team-betrieb"].id,
  ]
}
