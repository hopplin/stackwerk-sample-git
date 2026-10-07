provider "vsphere" {
  vsphere_server = var.vsphere_server
  user           = var.vsphere_user
  password       = var.vsphere_password
}

# Deliberately not declared in required_providers: stackwerk reports a provider that is only implied.
provider "random" {}
