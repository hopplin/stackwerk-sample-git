provider "vsphere" {
  vsphere_server = var.vsphere_server
  user           = var.vsphere_user
  password       = var.vsphere_password
}

provider "vault" {
  address = "https://vault.example.internal"
}
