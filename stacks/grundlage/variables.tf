variable "vsphere_server" {
  description = "Host name of the vCenter."
  type        = string
  default     = "vcenter.example.com"
}

variable "vsphere_user" {
  description = "Account OpenTofu signs in with."
  type        = string
  default     = "svc-opentofu@vsphere.local"
}

variable "vsphere_password" {
  description = "Password of the account. Comes from the pipeline."
  type        = string
  sensitive   = true
}

variable "esxi_root_password" {
  description = "Root password of the hosts. Deliberately with a default: stackwerk reports it and never shows the value."
  type        = string
  sensitive   = true
  default     = "Sommer2024!"
}

variable "license_key" {
  description = "License key of the hosts. Deliberately assigned in secrets.auto.tfvars: stackwerk reports it."
  type        = string
  sensitive   = true
}

variable "datacenter" {
  description = "Name of the datacenter."
  type        = string
  default     = "dc-nord"
}

variable "clusters" {
  description = "Clusters with the number of their hosts."
  type        = map(object({ hosts = number, rack = string }))
}

variable "folders" {
  description = "Folders for virtual machines, as paths."
  type        = list(string)
  default     = ["prod-nord", "prod-nord/web", "prod-nord/db", "dmz", "labor"]
}

variable "nfs_exports" {
  description = "NFS exports that become datastores."
  type        = map(object({ host = string, path = string }))
  default     = {}
}

variable "uplinks" {
  description = "Names of the uplinks of the distributed switch."
  type        = list(string)
  default     = ["uplink1", "uplink2"]
}

variable "spare_hosts" {
  description = "Number of spare hosts. Deliberately without a value anywhere: the code alone does not decide how many there are."
  type        = number
}

variable "ntp_servers" {
  description = "Deliberately never used: stackwerk reports it."
  type        = list(string)
  default     = ["10.10.30.2", "10.10.30.3"]
}
