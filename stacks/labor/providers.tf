provider "vsphere" {
  vsphere_server = var.vsphere_server
  user           = var.vsphere_user
  password       = var.vsphere_password
}

provider "docker" {
  alias    = "tools_lab_01"
  host     = "ssh://deploy@tools-lab-01.example.internal:22"
  ssh_opts = ["-i", var.docker_ssh_key]
}

provider "docker" {
  alias    = "tools_lab_02"
  host     = "ssh://deploy@tools-lab-02.example.internal:22"
  ssh_opts = ["-i", var.docker_ssh_key]
}
