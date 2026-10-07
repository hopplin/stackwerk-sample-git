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

variable "sandbox_servers" {
  type        = map(object({
    cluster   = string
    cpus      = number
    memory_gb = number
    ip        = string
  }))
  description = "Machines of the group sandbox by name."
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

variable "linux_root_password" {
  type        = string
  description = "Root password set while a Linux machine is customised."
  sensitive   = true
}

variable "docker_ssh_key" {
  type        = string
  description = "Path of the SSH key for the Docker hosts."
  sensitive   = true
}
