resource "vsphere_tag_category" "this" {
  for_each = toset(["backup", "umgebung", "verantwortlich", "kostenstelle"])

  name             = each.key
  cardinality      = "SINGLE"
  associable_types = ["VirtualMachine"]
}

resource "vsphere_tag" "backup" {
  for_each = toset(["daily", "weekly"])

  name        = each.key
  category_id = vsphere_tag_category.this["backup"].id
}

resource "vsphere_tag" "umgebung" {
  for_each = toset(["prod", "test"])

  name        = each.key
  category_id = vsphere_tag_category.this["umgebung"].id
}

resource "vsphere_tag" "verantwortlich" {
  for_each = toset(["team-betrieb", "team-daten", "team-plattform", "team-web"])

  name        = each.key
  category_id = vsphere_tag_category.this["verantwortlich"].id
}

resource "vsphere_tag" "kostenstelle" {
  for_each = toset(["4100", "4200", "4300", "4400"])

  name        = each.key
  category_id = vsphere_tag_category.this["kostenstelle"].id
}
