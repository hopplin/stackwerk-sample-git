vsphere_server = "vcenter-sued.example.internal"
datacenter     = "dc-sued"
nameservers    = ["10.20.30.10", "10.20.30.11"]

networks = {
  frontend = { vlan = 200, cidr = "10.20.0.0/24", gateway = "10.20.0.1", inbound = false }
  backend  = { vlan = 210, cidr = "10.20.10.0/24", gateway = "10.20.10.1", inbound = false }
  data     = { vlan = 220, cidr = "10.20.20.0/24", gateway = "10.20.20.1", inbound = false }
  mgmt     = { vlan = 230, cidr = "10.20.30.0/24", gateway = "10.20.30.1", inbound = false }
}

web_servers = {
  "web-sued-01" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.11" }
  "web-sued-02" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.12" }
  "web-sued-03" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.13" }
  "web-sued-04" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.14" }
  "web-sued-05" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.15" }
  "web-sued-06" = { cluster = "prod-d", cpus = 8, memory_gb = 16, ip = "10.20.0.16" }
  "web-sued-07" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.17" }
  "web-sued-08" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.18" }
  "web-sued-09" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.19" }
  "web-sued-10" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.20" }
  "web-sued-11" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.21" }
  "web-sued-12" = { cluster = "prod-d", cpus = 8, memory_gb = 16, ip = "10.20.0.22" }
  "web-sued-13" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.23" }
  "web-sued-14" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.24" }
  "web-sued-15" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.25" }
  "web-sued-16" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.26" }
  "web-sued-17" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.27" }
  "web-sued-18" = { cluster = "prod-d", cpus = 8, memory_gb = 16, ip = "10.20.0.28" }
  "web-sued-19" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.29" }
  "web-sued-20" = { cluster = "prod-d", cpus = 4, memory_gb = 8, ip = "10.20.0.30" }
}

app_servers = {
  "app-sued-01" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.11" }
  "app-sued-02" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.12" }
  "app-sued-03" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.13" }
  "app-sued-04" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.14" }
  "app-sued-05" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.15" }
  "app-sued-06" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.10.16" }
  "app-sued-07" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.17" }
  "app-sued-08" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.18" }
  "app-sued-09" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.19" }
  "app-sued-10" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.20" }
  "app-sued-11" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.21" }
  "app-sued-12" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.10.22" }
  "app-sued-13" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.23" }
  "app-sued-14" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.24" }
  "app-sued-15" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.25" }
  "app-sued-16" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.26" }
  "app-sued-17" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.27" }
  "app-sued-18" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.10.28" }
  "app-sued-19" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.29" }
  "app-sued-20" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.30" }
  "app-sued-21" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.31" }
  "app-sued-22" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.32" }
  "app-sued-23" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.33" }
  "app-sued-24" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.10.34" }
  "app-sued-25" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.35" }
  "app-sued-26" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.36" }
  "app-sued-27" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.37" }
  "app-sued-28" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.38" }
}

legacy_erp_servers = {
  "legacy-erp-sued-01" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.39" }
  "legacy-erp-sued-02" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.40" }
  "legacy-erp-sued-03" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.41" }
  "legacy-erp-sued-04" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.42" }
  "legacy-erp-sued-05" = { cluster = "prod-d", cpus = 4, memory_gb = 16, ip = "10.20.10.43" }
  "legacy-erp-sued-06" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.10.44" }
}

test_servers = {
  "test-sued-01" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.45" }
  "test-sued-02" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.46" }
  "test-sued-03" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.47" }
  "test-sued-04" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.48" }
  "test-sued-05" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.49" }
  "test-sued-06" = { cluster = "test-a", cpus = 4, memory_gb = 8, ip = "10.20.10.50" }
  "test-sued-07" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.51" }
  "test-sued-08" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.52" }
  "test-sued-09" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.53" }
  "test-sued-10" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.54" }
  "test-sued-11" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.55" }
  "test-sued-12" = { cluster = "test-a", cpus = 4, memory_gb = 8, ip = "10.20.10.56" }
  "test-sued-13" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.57" }
  "test-sued-14" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.58" }
  "test-sued-15" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.59" }
  "test-sued-16" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.60" }
  "test-sued-17" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.61" }
  "test-sued-18" = { cluster = "test-a", cpus = 4, memory_gb = 8, ip = "10.20.10.62" }
  "test-sued-19" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.63" }
  "test-sued-20" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.64" }
  "test-sued-21" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.65" }
  "test-sued-22" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.66" }
  "test-sued-23" = { cluster = "test-a", cpus = 2, memory_gb = 4, ip = "10.20.10.67" }
  "test-sued-24" = { cluster = "test-a", cpus = 4, memory_gb = 8, ip = "10.20.10.68" }
}

db_servers = {
  "db-sued-01" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.20.11" }
  "db-sued-02" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.20.12" }
  "db-sued-03" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.20.13" }
  "db-sued-04" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.20.14" }
  "db-sued-05" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.20.15" }
  "db-sued-06" = { cluster = "prod-d", cpus = 16, memory_gb = 64, ip = "10.20.20.16" }
  "db-sued-07" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.20.17" }
  "db-sued-08" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.20.18" }
  "db-sued-09" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.20.19" }
  "db-sued-10" = { cluster = "prod-d", cpus = 8, memory_gb = 32, ip = "10.20.20.20" }
}

tools_servers = {
  "tools-sued-01" = { cluster = "prod-d", cpus = 2, memory_gb = 8, ip = "10.20.30.11" }
  "tools-sued-02" = { cluster = "prod-d", cpus = 2, memory_gb = 8, ip = "10.20.30.12" }
  "tools-sued-03" = { cluster = "prod-d", cpus = 2, memory_gb = 8, ip = "10.20.30.13" }
  "tools-sued-04" = { cluster = "prod-d", cpus = 2, memory_gb = 8, ip = "10.20.30.14" }
}
