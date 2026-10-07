module "tools" {
  source   = "git::ssh://git@scm.example.com/infra/vsphere-landschaft.git//modules/vm-linux?ref=v1.4.0"
  for_each = var.tools_servers

  name             = each.key
  folder           = "labor/tools"
  resource_pool_id = data.vsphere_compute_cluster.this[each.value.cluster].resource_pool_id
  datastore_id     = data.vsphere_datastore.this[each.value.cluster].id
  network_id       = vsphere_distributed_port_group.this["mgmt"].id
  template_uuid    = data.vsphere_virtual_machine.template["tpl-debian-12"].id
  guest_id         = data.vsphere_virtual_machine.template["tpl-debian-12"].guest_id
  cpus             = each.value.cpus
  memory_gb        = each.value.memory_gb
  disk_gb          = 60
  ip               = each.value.ip
  gateway          = var.networks["mgmt"].gateway
  dns_servers      = var.nameservers
  domain           = var.domain
  root_password    = var.linux_root_password

  tags = [
    vsphere_tag.backup["weekly"].id,
    vsphere_tag.umgebung["labor"].id,
    vsphere_tag.verantwortlich["team-betrieb"].id,
    vsphere_tag.kostenstelle["9999"].id,
  ]
}
