data "vsphere_datacenter" "this" {
  name = var.datacenter
}

data "vsphere_distributed_virtual_switch" "main" {
  name          = "dvs-${local.site}"
  datacenter_id = data.vsphere_datacenter.this.id
}

data "vsphere_compute_cluster" "this" {
  for_each = toset(local.clusters)

  name          = each.key
  datacenter_id = data.vsphere_datacenter.this.id
}

data "vsphere_datastore" "this" {
  for_each = toset(local.clusters)

  name          = "ds-${each.key}"
  datacenter_id = data.vsphere_datacenter.this.id
}

data "vsphere_virtual_machine" "template" {
  for_each = toset(local.templates)

  name          = each.key
  datacenter_id = data.vsphere_datacenter.this.id
}

data "vsphere_host" "backup" {
  for_each = toset(["esx-nord-01.example.internal", "esx-nord-02.example.internal"])

  name          = each.key
  datacenter_id = data.vsphere_datacenter.this.id
}
