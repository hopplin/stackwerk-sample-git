resource "vsphere_datastore_cluster" "gold" {
  name          = "dsc-gold"
  datacenter_id = vsphere_datacenter.this.moid
  sdrs_enabled  = true
}

resource "vsphere_vmfs_datastore" "local" {
  for_each = local.hosts

  name                 = "ds-local-${each.key}"
  host_system_id       = vsphere_host.this[each.key].id
  datastore_cluster_id = vsphere_datastore_cluster.gold.id
  disks                = ["mpx.vmhba1:C0:T1:L0"]
}

resource "vsphere_nas_datastore" "export" {
  for_each = var.nfs_exports

  name            = each.key
  host_system_ids = [for host in vsphere_host.this : host.id]
  type            = "NFS"
  remote_hosts    = [each.value.host]
  remote_path     = each.value.path
}

resource "vsphere_virtual_disk" "quorum" {
  vmdk_path  = "/quorum/quorum.vmdk"
  size       = 4
  type       = "thin"
  datacenter = vsphere_datacenter.this.name
  datastore  = vsphere_nas_datastore.export["nfs-backup"].name
}
