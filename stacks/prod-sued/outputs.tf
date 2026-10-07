output "vm_ips" {
  description = "IP address of every machine by name."
  value = merge(
    { for name, server in var.web_servers : name => server.ip },
    { for name, server in var.app_servers : name => server.ip },
    { for name, server in var.legacy_erp_servers : name => server.ip },
    { for name, server in var.test_servers : name => server.ip },
    { for name, server in var.db_servers : name => server.ip },
    { for name, server in var.tools_servers : name => server.ip }
  )
}

output "portgroup_ids" {
  description = "Identifiers of the port groups by name."
  value       = { for name, group in vsphere_distributed_port_group.this : name => group.id }
}
