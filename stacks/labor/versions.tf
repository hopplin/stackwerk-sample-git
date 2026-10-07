terraform {
  required_version = "~> 1.8.0"

  required_providers {
    vsphere = {
      source  = "vmware/vsphere"
      version = "~> 2.17"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}
