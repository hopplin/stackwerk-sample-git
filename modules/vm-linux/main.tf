resource "vsphere_virtual_machine" "this" {
  name             = var.name
  folder           = var.folder
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id
  guest_id         = var.guest_id
  num_cpus         = var.cpus
  memory           = var.memory_gb * 1024
  firmware         = "efi"
  tags             = var.tags

  network_interface {
    network_id = var.network_id
  }

  disk {
    label            = "disk0"
    size             = var.disk_gb
    thin_provisioned = true
  }

  clone {
    template_uuid = var.template_uuid

    customize {
      linux_options {
        host_name = var.name
        domain    = var.domain
      }

      network_interface {
        ipv4_address = var.ip
        ipv4_netmask = 24
      }

      ipv4_gateway    = var.gateway
      dns_server_list = var.dns_servers
    }
  }

  lifecycle {
    ignore_changes = [clone[0].template_uuid]
  }
}
