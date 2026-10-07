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

variable "proxy_servers" {
  type        = map(object({
    cluster   = string
    cpus      = number
    memory_gb = number
    ip        = string
  }))
  description = "Machines of the group proxy by name."
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

variable "k8s_worker_servers" {
  type        = map(object({
    cluster   = string
    cpus      = number
    memory_gb = number
    ip        = string
  }))
  description = "Machines of the group k8s_worker by name."
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

variable "fileserver_servers" {
  type        = map(object({
    cluster   = string
    cpus      = number
    memory_gb = number
    ip        = string
  }))
  description = "Machines of the group fileserver by name."
}

variable "ldap_servers" {
  type        = map(object({
    cluster   = string
    cpus      = number
    memory_gb = number
    ip        = string
  }))
  description = "Machines of the group ldap by name."
}

variable "monitoring_servers" {
  type        = map(object({
    cluster   = string
    cpus      = number
    memory_gb = number
    ip        = string
  }))
  description = "Machines of the group monitoring by name."
}

variable "nsxt_password" {
  type        = string
  description = "Password of the NSX account."
  sensitive   = true
}

variable "kubeconfig" {
  type        = string
  description = "Path of the kubeconfig the pipeline provides."
  sensitive   = true
}
