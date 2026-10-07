vsphere_server = "vcenter-nord.example.internal"
datacenter     = "dc-nord"
nameservers    = ["10.30.30.10", "10.30.30.11"]

networks = {
  frontend = { vlan = 300, cidr = "10.30.0.0/24", gateway = "10.30.0.1", inbound = true }
  mail     = { vlan = 310, cidr = "10.30.10.0/24", gateway = "10.30.10.1", inbound = true }
  mgmt     = { vlan = 330, cidr = "10.30.30.0/24", gateway = "10.30.30.1", inbound = false }
}

proxy_servers = {
  "proxy-dmz-01" = { cluster = "dmz-a", cpus = 4, memory_gb = 8, ip = "10.30.0.11" }
  "proxy-dmz-02" = { cluster = "dmz-a", cpus = 4, memory_gb = 8, ip = "10.30.0.12" }
  "proxy-dmz-03" = { cluster = "dmz-a", cpus = 4, memory_gb = 8, ip = "10.30.0.13" }
  "proxy-dmz-04" = { cluster = "dmz-a", cpus = 4, memory_gb = 8, ip = "10.30.0.14" }
  "proxy-dmz-05" = { cluster = "dmz-a", cpus = 4, memory_gb = 8, ip = "10.30.0.15" }
  "proxy-dmz-06" = { cluster = "dmz-a", cpus = 8, memory_gb = 16, ip = "10.30.0.16" }
  "proxy-dmz-07" = { cluster = "dmz-a", cpus = 4, memory_gb = 8, ip = "10.30.0.17" }
  "proxy-dmz-08" = { cluster = "dmz-a", cpus = 4, memory_gb = 8, ip = "10.30.0.18" }
}

dns_servers = {
  "dns-dmz-01" = { cluster = "dmz-a", cpus = 2, memory_gb = 4, ip = "10.30.0.19" }
  "dns-dmz-02" = { cluster = "dmz-a", cpus = 2, memory_gb = 4, ip = "10.30.0.20" }
  "dns-dmz-03" = { cluster = "dmz-a", cpus = 2, memory_gb = 4, ip = "10.30.0.21" }
  "dns-dmz-04" = { cluster = "dmz-a", cpus = 2, memory_gb = 4, ip = "10.30.0.22" }
}

mail_servers = {
  "mail-dmz-01" = { cluster = "dmz-a", cpus = 4, memory_gb = 16, ip = "10.30.10.11" }
  "mail-dmz-02" = { cluster = "dmz-a", cpus = 4, memory_gb = 16, ip = "10.30.10.12" }
  "mail-dmz-03" = { cluster = "dmz-a", cpus = 4, memory_gb = 16, ip = "10.30.10.13" }
  "mail-dmz-04" = { cluster = "dmz-a", cpus = 4, memory_gb = 16, ip = "10.30.10.14" }
}

jump_servers = {
  "jump-dmz-01" = { cluster = "dmz-a", cpus = 2, memory_gb = 8, ip = "10.30.30.11" }
  "jump-dmz-02" = { cluster = "dmz-a", cpus = 2, memory_gb = 8, ip = "10.30.30.12" }
}
