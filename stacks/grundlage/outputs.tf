output "datacenter_id" {
  description = "ID of the datacenter, for the stacks that build on this one."
  value       = vsphere_datacenter.this.moid
}

output "hosts" {
  description = "Host names by key."
  value       = { for key, host in vsphere_host.this : key => host.hostname }
}

output "backup_password" {
  description = "Password of the backup machine."
  value       = random_password.vcsa_backup.result
  sensitive   = true
}
