resource "vsphere_host" "this" {
  for_each = local.hosts

  hostname   = "${each.key}.${local.host_domain}"
  username   = "root"
  password   = var.esxi_root_password
  license    = var.license_key
  cluster    = vsphere_compute_cluster.this[each.value.cluster].id
  datacenter = vsphere_datacenter.this.moid
}

# The number of spare hosts comes from a variable without a value: stackwerk shows the block once and marks it as open.
resource "vsphere_host" "spare" {
  count = var.spare_hosts

  hostname   = "spare-${count.index + 1}.${local.host_domain}"
  username   = "root"
  password   = var.esxi_root_password
  datacenter = vsphere_datacenter.this.moid
}

resource "vsphere_compute_cluster" "this" {
  for_each = var.clusters

  name          = each.key
  datacenter_id = vsphere_datacenter.this.moid
  drs_enabled   = true
  ha_enabled    = true
}

resource "vsphere_resource_pool" "tier" {
  count = 2

  name                    = "tier-${count.index + 1}"
  parent_resource_pool_id = vsphere_compute_cluster.this["prod-a"].resource_pool_id
}

resource "vsphere_vapp_container" "erp" {
  name                    = "erp"
  parent_resource_pool_id = vsphere_resource_pool.tier[0].id
}
