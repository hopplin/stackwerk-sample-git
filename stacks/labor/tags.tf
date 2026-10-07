resource "vsphere_tag_category" "this" {
  for_each = toset(["backup", "umgebung", "verantwortlich", "kostenstelle"])

  name             = each.key
  cardinality      = "SINGLE"
  associable_types = ["VirtualMachine"]
}

resource "vsphere_tag" "backup" {
  for_each = toset(["weekly"])

  name        = each.key
  category_id = vsphere_tag_category.this["backup"].id
}

resource "vsphere_tag" "umgebung" {
  for_each = toset(["labor"])

  name        = each.key
  category_id = vsphere_tag_category.this["umgebung"].id
}

resource "vsphere_tag" "verantwortlich" {
  for_each = toset(["team-betrieb"])

  name        = each.key
  category_id = vsphere_tag_category.this["verantwortlich"].id
}

resource "vsphere_tag" "kostenstelle" {
  for_each = toset(["9999"])

  name        = each.key
  category_id = vsphere_tag_category.this["kostenstelle"].id
}
