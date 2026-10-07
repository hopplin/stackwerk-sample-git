vsphere_server = "vcenter-lab.example.internal"
datacenter     = "dc-lab"
nameservers    = ["10.40.30.10", "10.40.30.11"]

networks = {
  lab  = { vlan = 400, cidr = "10.40.0.0/24", gateway = "10.40.0.1", inbound = false }
  mgmt = { vlan = 430, cidr = "10.40.30.0/24", gateway = "10.40.30.1", inbound = false }
}

sandbox_servers = {
  "sandbox-lab-01" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.0.11" }
  "sandbox-lab-02" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.0.12" }
  "sandbox-lab-03" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.0.13" }
  "sandbox-lab-04" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.0.14" }
  "sandbox-lab-05" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.0.15" }
  "sandbox-lab-06" = { cluster = "lab-a", cpus = 4, memory_gb = 8, ip = "10.40.0.16" }
  "sandbox-lab-07" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.0.17" }
  "sandbox-lab-08" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.0.18" }
  "sandbox-lab-09" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.0.19" }
  "sandbox-lab-10" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.0.20" }
  "sandbox-lab-11" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.0.21" }
  "sandbox-lab-12" = { cluster = "lab-a", cpus = 4, memory_gb = 8, ip = "10.40.0.22" }
}

tools_servers = {
  "tools-lab-01" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.30.11" }
  "tools-lab-02" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.30.12" }
  "tools-lab-03" = { cluster = "lab-a", cpus = 2, memory_gb = 4, ip = "10.40.30.13" }
}
