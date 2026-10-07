module "proxy" {
  source   = "../../modules/vm-linux"
  for_each = var.proxy_servers

  name             = each.key
  folder           = "dmz/proxy"
  resource_pool_id = data.vsphere_compute_cluster.this[each.value.cluster].resource_pool_id
  datastore_id     = data.vsphere_datastore.this[each.value.cluster].id
  network_id       = vsphere_distributed_port_group.this["frontend"].id
  template_uuid    = data.vsphere_virtual_machine.template["tpl-debian-12"].id
  guest_id         = data.vsphere_virtual_machine.template["tpl-debian-12"].guest_id
  cpus             = each.value.cpus
  memory_gb        = each.value.memory_gb
  disk_gb          = 60
  ip               = each.value.ip
  gateway          = var.networks["frontend"].gateway
  dns_servers      = var.nameservers
  domain           = var.domain
  root_password    = var.linux_root_password

  tags = [
    vsphere_tag.backup["daily"].id,
    vsphere_tag.umgebung["dmz"].id,
    vsphere_tag.verantwortlich["team-web"].id,
  ]
}
