resource "vsphere_distributed_virtual_switch" "core" {
  name          = "dvs-core"
  datacenter_id = vsphere_datacenter.this.moid
  version       = "8.0.0"
  uplinks       = var.uplinks

  dynamic "host" {
    for_each = vsphere_host.this

    content {
      host_system_id = host.value.id
      devices        = ["vmnic2", "vmnic3"]
    }
  }
}

resource "vsphere_distributed_port_group" "transport" {
  name                            = "pg-transport"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.core.id
  vlan_id                         = 90
}

resource "vsphere_host_virtual_switch" "mgmt" {
  for_each = local.hosts

  name             = "vSwitch0"
  host_system_id   = vsphere_host.this[each.key].id
  network_adapters = ["vmnic0", "vmnic1"]
  active_nics      = ["vmnic0"]
  standby_nics     = ["vmnic1"]
}

resource "vsphere_host_port_group" "mgmt" {
  for_each = local.hosts

  name                = "pg-mgmt"
  host_system_id      = vsphere_host.this[each.key].id
  virtual_switch_name = vsphere_host_virtual_switch.mgmt[each.key].name
  vlan_id             = 130
}
