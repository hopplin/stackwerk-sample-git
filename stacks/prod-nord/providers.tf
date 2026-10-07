provider "vsphere" {
  vsphere_server = var.vsphere_server
  user           = var.vsphere_user
  password       = var.vsphere_password
}

provider "nsxt" {
  host     = "nsx-nord.example.internal"
  username = "svc-tofu"
  password = var.nsxt_password
}

provider "vault" {
  address = "https://vault.example.internal"
}

provider "kubernetes" {
  config_path = var.kubeconfig
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig
  }
}
