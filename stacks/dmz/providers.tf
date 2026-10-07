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

provider "docker" {
  alias    = "mail_dmz_01"
  host     = "ssh://deploy@mail-dmz-01.example.internal:22"
  ssh_opts = ["-i", var.docker_ssh_key]
}

provider "docker" {
  alias    = "proxy_dmz_01"
  host     = "ssh://deploy@proxy-dmz-01.example.internal:22"
  ssh_opts = ["-i", var.docker_ssh_key]
}

provider "docker" {
  alias    = "proxy_dmz_02"
  host     = "ssh://deploy@proxy-dmz-02.example.internal:22"
  ssh_opts = ["-i", var.docker_ssh_key]
}
