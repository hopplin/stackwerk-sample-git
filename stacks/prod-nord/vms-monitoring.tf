module "monitoring" {
  source   = "../../modules/vm-linux"
  for_each = var.monitoring_servers

  name             = each.key
  folder           = "prod-nord/monitoring"
  resource_pool_id = data.vsphere_compute_cluster.this[each.value.cluster].resource_pool_id
  datastore_id     = data.vsphere_datastore.this[each.value.cluster].id
  network_id       = vsphere_distributed_port_group.this["monitoring"].id
  template_uuid    = data.vsphere_virtual_machine.template["tpl-debian-12"].id
  guest_id         = data.vsphere_virtual_machine.template["tpl-debian-12"].guest_id
  cpus             = each.value.cpus
  memory_gb        = each.value.memory_gb
  disk_gb          = 300
  ip               = each.value.ip
  gateway          = var.networks["monitoring"].gateway
  dns_servers      = var.nameservers
  domain           = var.domain
  root_password    = data.vault_kv_secret_v2.vm_admin.data["linux_root_password"]

  tags = [
    vsphere_tag.backup["weekly"].id,
    vsphere_tag.umgebung["prod"].id,
    vsphere_tag.verantwortlich["team-betrieb"].id,
    vsphere_tag.kostenstelle["4400"].id,
  ]
}
