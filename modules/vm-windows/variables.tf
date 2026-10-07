variable "name" {
  type        = string
  description = "Name of the machine in vCenter and its host name."
}

variable "folder" {
  type        = string
  description = "Folder of the machine in vCenter."
}

variable "resource_pool_id" {
  type        = string
  description = "Resource pool the machine runs in."
}

variable "datastore_id" {
  type        = string
  description = "Datastore of the system disk."
}

variable "network_id" {
  type        = string
  description = "Port group the machine attaches to."
}

variable "template_uuid" {
  type        = string
  description = "Template the machine is cloned from."
}

variable "guest_id" {
  type        = string
  description = "Guest type, taken from the template."
}

variable "cpus" {
  type        = number
  description = "Number of virtual CPUs."
}

variable "memory_gb" {
  type        = number
  description = "Main memory in GiB."
}

variable "disk_gb" {
  type        = number
  description = "Size of the system disk in GiB."
  default     = 60
}

variable "ip" {
  type        = string
  description = "IPv4 address of the machine."
}

variable "gateway" {
  type        = string
  description = "Default gateway."
}

variable "dns_servers" {
  type        = list(string)
  description = "DNS servers."
}

variable "domain" {
  type        = string
  description = "DNS domain."
}

variable "tags" {
  type        = list(string)
  description = "Identifiers of the tags to attach."
  default     = []
}

variable "admin_password" {
  type        = string
  description = "Password of the local administrator."
  sensitive   = true
}

variable "domain_join_password" {
  type        = string
  description = "Password of the account that joins the machine to the domain."
  sensitive   = true
}
