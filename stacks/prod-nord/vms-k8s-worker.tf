module "k8s_worker" {
  source   = "../../modules/vm-linux"
  for_each = var.k8s_worker_servers

  name             = each.key
  folder           = "prod-nord/k8s-worker"
  resource_pool_id = data.vsphere_compute_cluster.this[each.value.cluster].resource_pool_id
  datastore_id     = data.vsphere_datastore.this[each.value.cluster].id
  network_id       = vsphere_distributed_port_group.this["backend"].id
  template_uuid    = data.vsphere_virtual_machine.template["tpl-ubuntu-2204"].id
  guest_id         = data.vsphere_virtual_machine.template["tpl-ubuntu-2204"].guest_id
  cpus             = each.value.cpus
  memory_gb        = each.value.memory_gb
  disk_gb          = 200
  ip               = each.value.ip
  gateway          = var.networks["backend"].gateway
  dns_servers      = var.nameservers
  domain           = var.domain
  root_password    = data.vault_kv_secret_v2.vm_admin.data["linux_root_password"]

  tags = [
    vsphere_tag.umgebung["prod"].id,
    vsphere_tag.verantwortlich["team-plattform"].id,
    vsphere_tag.kostenstelle["4200"].id,
  ]
}
