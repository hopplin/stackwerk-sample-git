# A machine declared directly as a resource, without the modules the other stacks use.
resource "vsphere_virtual_machine" "vcsa_backup" {
  name             = "vcsa-backup-01"
  annotation       = "Receives the file based backup of the vCenter."
  folder           = vsphere_folder.vm["prod-nord"].path
  resource_pool_id = vsphere_resource_pool.tier[1].id
  datastore_id     = vsphere_nas_datastore.export["nfs-backup"].id
  guest_id         = "debian12_64Guest"
  num_cpus         = 2
  memory           = 4096

  network_interface {
    network_id = vsphere_distributed_port_group.transport.id
  }

  disk {
    label = "disk0"
    size  = 40
  }

  disk {
    label        = "disk1"
    size         = 500
    unit_number  = 1
    datastore_id = vsphere_nas_datastore.export["nfs-backup"].id
  }
}

resource "random_password" "vcsa_backup" {
  length = 32
}
