resource "vsphere_tag_category" "this" {
  for_each = toset(["backup", "umgebung", "verantwortlich"])

  name             = each.key
  cardinality      = "SINGLE"
  associable_types = ["VirtualMachine"]
}

resource "vsphere_tag" "backup" {
  for_each = toset(["daily"])

  name        = each.key
  category_id = vsphere_tag_category.this["backup"].id
}

resource "vsphere_tag" "umgebung" {
  for_each = toset(["dmz"])

  name        = each.key
  category_id = vsphere_tag_category.this["umgebung"].id
}

resource "vsphere_tag" "verantwortlich" {
  for_each = toset(["team-betrieb", "team-web"])

  name        = each.key
  category_id = vsphere_tag_category.this["verantwortlich"].id
}
