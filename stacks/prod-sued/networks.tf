resource "vsphere_distributed_port_group" "this" {
  for_each = var.networks

  name                            = "${each.key}-${local.site}"
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.main.id
  vlan_id                         = each.value.vlan
}
