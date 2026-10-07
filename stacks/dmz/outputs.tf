output "vm_ips" {
  description = "IP address of every machine by name."
  value = merge(
    { for name, server in var.proxy_servers : name => server.ip },
    { for name, server in var.dns_servers : name => server.ip },
    { for name, server in var.mail_servers : name => server.ip },
    { for name, server in var.jump_servers : name => server.ip }
  )
}

output "portgroup_ids" {
  description = "Identifiers of the port groups by name."
  value       = { for name, group in vsphere_distributed_port_group.this : name => group.id }
}
