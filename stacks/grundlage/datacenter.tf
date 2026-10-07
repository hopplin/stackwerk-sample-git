resource "vsphere_datacenter" "this" {
  name = var.datacenter
}

resource "vsphere_folder" "vm" {
  for_each = local.vm_folders

  path          = each.value
  type          = "vm"
  datacenter_id = vsphere_datacenter.this.moid
}
