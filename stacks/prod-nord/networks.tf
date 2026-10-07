resource "vsphere_distributed_port_group" "this" {
  for_each = var.networks

  name                            = "${each.key}-${local.site}"
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.main.id
  vlan_id                         = each.value.vlan
}

resource "vsphere_nas_datastore" "backup" {
  name            = "nas-backup-${local.site}"
  host_system_ids = [for host in data.vsphere_host.backup : host.id]
  type            = "NFS"
  remote_hosts    = ["nas-nord.example.internal"]
  remote_path     = "/export/backup"
}
