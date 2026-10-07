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

  wait_for_guest_net_timeout = 5

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
      windows_options {
        computer_name         = var.name
        admin_password        = var.admin_password
        join_domain           = var.domain
        domain_admin_user     = "svc-join"
        domain_admin_password = var.domain_join_password
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
