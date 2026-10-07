output "vm_ips" {
  description = "IP address of every machine by name."
  value = merge(
    { for name, server in var.sandbox_servers : name => server.ip },
    { for name, server in var.tools_servers : name => server.ip }
  )
}

output "portgroup_ids" {
  description = "Identifiers of the port groups by name."
  value       = { for name, group in vsphere_distributed_port_group.this : name => group.id }
}
