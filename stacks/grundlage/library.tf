resource "vsphere_content_library" "templates" {
  name            = "templates"
  description     = "Templates every stack clones its machines from."
  storage_backing = [vsphere_nas_datastore.export["nfs-iso"].id]
}

resource "vsphere_content_library_item" "debian" {
  name        = "tpl-debian-12"
  description = "Debian 12, hardened"
  type        = "ovf"
  library_id  = vsphere_content_library.templates.id
  file_url    = "https://images.example.com/tpl-debian-12.ovf"
}
