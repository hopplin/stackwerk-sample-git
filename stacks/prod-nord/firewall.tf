locals {
  firewall_rules = {
    frontend-von-aussen = { from = [], to = ["frontend"], ports = ["443"], action = "ALLOW" }
    mgmt-zu-frontend    = { from = ["mgmt"], to = ["frontend"], ports = ["22"], action = "ALLOW" }
    mgmt-zu-backend     = { from = ["mgmt"], to = ["backend"], ports = ["22"], action = "ALLOW" }
    mgmt-zu-data        = { from = ["mgmt"], to = ["data"], ports = ["22"], action = "ALLOW" }
    standard            = { from = [], to = [], ports = [], action = "DROP" }
  }
}

data "nsxt_policy_tier0_gateway" "uplink" {
  display_name = "t0-uplink"
}

resource "nsxt_policy_tier1_gateway" "zone" {
  display_name              = "t1-${local.site}"
  tier0_path                = data.nsxt_policy_tier0_gateway.uplink.path
  route_advertisement_types = ["TIER1_CONNECTED"]
}

resource "nsxt_policy_group" "net" {
  for_each = var.networks

  display_name = "${each.key}-${local.site}"

  criteria {
    ipaddress_expression {
      ip_addresses = [each.value.cidr]
    }
  }
}

resource "nsxt_policy_service" "tcp" {
  for_each = toset(["22", "443"])

  display_name = "tcp-${each.key}"

  l4_port_set_entry {
    display_name      = "tcp-${each.key}"
    protocol          = "TCP"
    destination_ports = [each.key]
  }
}

resource "nsxt_policy_gateway_policy" "zone" {
  display_name = "zone-${local.site}"
  category     = "LocalGatewayRules"

  dynamic "rule" {
    for_each = local.firewall_rules

    content {
      display_name       = rule.key
      action             = rule.value.action
      scope              = [nsxt_policy_tier1_gateway.zone.path]
      source_groups      = [for name in rule.value.from : nsxt_policy_group.net[name].path]
      destination_groups = [for name in rule.value.to : nsxt_policy_group.net[name].path]
      services           = [for port in rule.value.ports : nsxt_policy_service.tcp[port].path]
    }
  }
}
