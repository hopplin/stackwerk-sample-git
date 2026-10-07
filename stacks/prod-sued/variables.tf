variable "vsphere_server" {
  type        = string
  description = "Address of the vCenter server."
}

variable "vsphere_user" {
  type        = string
  description = "Account OpenTofu signs in with."
  sensitive   = true
}

variable "vsphere_password" {
  type        = string
  description = "Password of that account."
  sensitive   = true
}

variable "datacenter" {
  type        = string
  description = "Name of the datacenter in vCenter."
}

variable "domain" {
  type        = string
  description = "DNS domain of the machines."
  default     = "example.internal"
}

variable "nameservers" {
  type        = list(string)
  description = "DNS servers the machines use."
}

variable "networks" {
  type        = map(object({
    vlan    = number
    cidr    = string
    gateway = string
    inbound = bool
  }))
  description = "Port groups of the stack by name."
}

variable "web_servers" {
  type        = map(object({
    cluster   = string
    cpus      = number
    memory_gb = number
    ip        = string
  }))
  description = "Machines of the group web by name."
}

variable "app_servers" {
  type        = map(object({
    cluster   = string
    cpus      = number
    memory_gb = number
    ip        = string
  }))
  description = "Machines of the group app by name."
}

variable "legacy_erp_servers" {
  type        = map(object({
    cluster   = string
    cpus      = number
    memory_gb = number
    ip        = string
  }))
  description = "Machines of the group legacy_erp by name."
}

variable "test_servers" {
  type        = map(object({
    cluster   = string
    cpus      = number
    memory_gb = number
    ip        = string
  }))
  description = "Machines of the group test by name."
}

variable "db_servers" {
  type        = map(object({
    cluster   = string
    cpus      = number
    memory_gb = number
    ip        = string
  }))
  description = "Machines of the group db by name."
}

variable "tools_servers" {
  type        = map(object({
    cluster   = string
    cpus      = number
    memory_gb = number
    ip        = string
  }))
  description = "Machines of the group tools by name."
}

variable "ntp_servers" {
  type        = list(string)
  description = "NTP servers of the site."
  default     = ["10.20.30.10", "10.20.30.11"]
}
