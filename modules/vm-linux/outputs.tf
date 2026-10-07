output "id" {
  description = "Identifier of the machine."
  value       = vsphere_virtual_machine.this.id
}

output "name" {
  description = "Name of the machine."
  value       = vsphere_virtual_machine.this.name
}

output "ip" {
  description = "IPv4 address of the machine."
  value       = var.ip
}
