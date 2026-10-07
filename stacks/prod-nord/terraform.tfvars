vsphere_server = "vcenter-nord.example.internal"
datacenter     = "dc-nord"
nameservers    = ["10.10.30.10", "10.10.30.11"]

networks = {
  frontend = { vlan = 100, cidr = "10.10.0.0/24", gateway = "10.10.0.1", inbound = true }
  backend  = { vlan = 110, cidr = "10.10.10.0/24", gateway = "10.10.10.1", inbound = false }
  data     = { vlan = 120, cidr = "10.10.20.0/24", gateway = "10.10.20.1", inbound = false }
  mgmt     = { vlan = 130, cidr = "10.10.30.0/24", gateway = "10.10.30.1", inbound = false }
}

web_servers = {
  "web-nord-01" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.11" }
  "web-nord-02" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.12" }
  "web-nord-03" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.13" }
  "web-nord-04" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.14" }
  "web-nord-05" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.15" }
  "web-nord-06" = { cluster = "prod-a", cpus = 8, memory_gb = 16, ip = "10.10.0.16" }
  "web-nord-07" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.17" }
  "web-nord-08" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.18" }
  "web-nord-09" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.19" }
  "web-nord-10" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.20" }
  "web-nord-11" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.21" }
  "web-nord-12" = { cluster = "prod-a", cpus = 8, memory_gb = 16, ip = "10.10.0.22" }
  "web-nord-13" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.23" }
  "web-nord-14" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.24" }
  "web-nord-15" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.25" }
  "web-nord-16" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.26" }
  "web-nord-17" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.27" }
  "web-nord-18" = { cluster = "prod-a", cpus = 8, memory_gb = 16, ip = "10.10.0.28" }
  "web-nord-19" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.29" }
  "web-nord-20" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.30" }
  "web-nord-21" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.31" }
  "web-nord-22" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.32" }
  "web-nord-23" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.33" }
  "web-nord-24" = { cluster = "prod-a", cpus = 8, memory_gb = 16, ip = "10.10.0.34" }
  "web-nord-25" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.35" }
  "web-nord-26" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.36" }
  "web-nord-27" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.37" }
  "web-nord-28" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.38" }
  "web-nord-29" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.39" }
  "web-nord-30" = { cluster = "prod-a", cpus = 8, memory_gb = 16, ip = "10.10.0.40" }
  "web-nord-31" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.41" }
  "web-nord-32" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.42" }
  "web-nord-33" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.43" }
  "web-nord-34" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.44" }
  "web-nord-35" = { cluster = "prod-b", cpus = 4, memory_gb = 8, ip = "10.10.0.45" }
  "web-nord-36" = { cluster = "prod-a", cpus = 8, memory_gb = 16, ip = "10.10.0.46" }
}

proxy_servers = {
  "proxy-nord-01" = { cluster = "prod-b", cpus = 2, memory_gb = 4, ip = "10.10.0.47" }
  "proxy-nord-02" = { cluster = "prod-a", cpus = 2, memory_gb = 4, ip = "10.10.0.48" }
  "proxy-nord-03" = { cluster = "prod-b", cpus = 2, memory_gb = 4, ip = "10.10.0.49" }
  "proxy-nord-04" = { cluster = "prod-a", cpus = 2, memory_gb = 4, ip = "10.10.0.50" }
  "proxy-nord-05" = { cluster = "prod-b", cpus = 2, memory_gb = 4, ip = "10.10.0.51" }
  "proxy-nord-06" = { cluster = "prod-a", cpus = 4, memory_gb = 8, ip = "10.10.0.52" }
}

app_servers = {
  "app-nord-01" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.11" }
  "app-nord-02" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.12" }
  "app-nord-03" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.13" }
  "app-nord-04" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.14" }
  "app-nord-05" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.15" }
  "app-nord-06" = { cluster = "prod-a", cpus = 8, memory_gb = 32, ip = "10.10.10.16" }
  "app-nord-07" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.17" }
  "app-nord-08" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.18" }
  "app-nord-09" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.19" }
  "app-nord-10" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.20" }
  "app-nord-11" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.21" }
  "app-nord-12" = { cluster = "prod-a", cpus = 8, memory_gb = 32, ip = "10.10.10.22" }
  "app-nord-13" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.23" }
  "app-nord-14" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.24" }
  "app-nord-15" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.25" }
  "app-nord-16" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.26" }
  "app-nord-17" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.27" }
  "app-nord-18" = { cluster = "prod-a", cpus = 8, memory_gb = 32, ip = "10.10.10.28" }
  "app-nord-19" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.29" }
  "app-nord-20" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.30" }
  "app-nord-21" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.31" }
  "app-nord-22" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.32" }
  "app-nord-23" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.33" }
  "app-nord-24" = { cluster = "prod-a", cpus = 8, memory_gb = 32, ip = "10.10.10.34" }
  "app-nord-25" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.35" }
  "app-nord-26" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.36" }
  "app-nord-27" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.37" }
  "app-nord-28" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.38" }
  "app-nord-29" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.39" }
  "app-nord-30" = { cluster = "prod-a", cpus = 8, memory_gb = 32, ip = "10.10.10.40" }
  "app-nord-31" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.41" }
  "app-nord-32" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.42" }
  "app-nord-33" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.43" }
  "app-nord-34" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.44" }
  "app-nord-35" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.45" }
  "app-nord-36" = { cluster = "prod-a", cpus = 8, memory_gb = 32, ip = "10.10.10.46" }
  "app-nord-37" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.47" }
  "app-nord-38" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.48" }
  "app-nord-39" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.49" }
  "app-nord-40" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.50" }
  "app-nord-41" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.51" }
  "app-nord-42" = { cluster = "prod-a", cpus = 8, memory_gb = 32, ip = "10.10.10.52" }
  "app-nord-43" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.53" }
  "app-nord-44" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.54" }
  "app-nord-45" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.55" }
  "app-nord-46" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.10.56" }
  "app-nord-47" = { cluster = "prod-b", cpus = 4, memory_gb = 16, ip = "10.10.10.57" }
  "app-nord-48" = { cluster = "prod-a", cpus = 8, memory_gb = 32, ip = "10.10.10.58" }
}

k8s_worker_servers = {
  "k8s-worker-nord-01" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.59" }
  "k8s-worker-nord-02" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.60" }
  "k8s-worker-nord-03" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.61" }
  "k8s-worker-nord-04" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.62" }
  "k8s-worker-nord-05" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.63" }
  "k8s-worker-nord-06" = { cluster = "prod-b", cpus = 16, memory_gb = 64, ip = "10.10.10.64" }
  "k8s-worker-nord-07" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.65" }
  "k8s-worker-nord-08" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.66" }
  "k8s-worker-nord-09" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.67" }
  "k8s-worker-nord-10" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.68" }
  "k8s-worker-nord-11" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.69" }
  "k8s-worker-nord-12" = { cluster = "prod-b", cpus = 16, memory_gb = 64, ip = "10.10.10.70" }
  "k8s-worker-nord-13" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.71" }
  "k8s-worker-nord-14" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.72" }
  "k8s-worker-nord-15" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.73" }
  "k8s-worker-nord-16" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.74" }
  "k8s-worker-nord-17" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.75" }
  "k8s-worker-nord-18" = { cluster = "prod-b", cpus = 16, memory_gb = 64, ip = "10.10.10.76" }
  "k8s-worker-nord-19" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.77" }
  "k8s-worker-nord-20" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.78" }
  "k8s-worker-nord-21" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.79" }
  "k8s-worker-nord-22" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.80" }
  "k8s-worker-nord-23" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.81" }
  "k8s-worker-nord-24" = { cluster = "prod-b", cpus = 16, memory_gb = 64, ip = "10.10.10.82" }
  "k8s-worker-nord-25" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.83" }
  "k8s-worker-nord-26" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.84" }
  "k8s-worker-nord-27" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.85" }
  "k8s-worker-nord-28" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.86" }
  "k8s-worker-nord-29" = { cluster = "prod-b", cpus = 8, memory_gb = 32, ip = "10.10.10.87" }
  "k8s-worker-nord-30" = { cluster = "prod-b", cpus = 16, memory_gb = 64, ip = "10.10.10.88" }
}

db_servers = {
  "db-nord-01" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.11" }
  "db-nord-02" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.12" }
  "db-nord-03" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.13" }
  "db-nord-04" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.14" }
  "db-nord-05" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.15" }
  "db-nord-06" = { cluster = "prod-a", cpus = 16, memory_gb = 128, ip = "10.10.20.16" }
  "db-nord-07" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.17" }
  "db-nord-08" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.18" }
  "db-nord-09" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.19" }
  "db-nord-10" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.20" }
  "db-nord-11" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.21" }
  "db-nord-12" = { cluster = "prod-a", cpus = 16, memory_gb = 128, ip = "10.10.20.22" }
  "db-nord-13" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.23" }
  "db-nord-14" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.24" }
  "db-nord-15" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.25" }
  "db-nord-16" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.26" }
  "db-nord-17" = { cluster = "prod-a", cpus = 8, memory_gb = 64, ip = "10.10.20.27" }
  "db-nord-18" = { cluster = "prod-a", cpus = 16, memory_gb = 128, ip = "10.10.20.28" }
}

fileserver_servers = {
  "fileserver-nord-01" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.20.29" }
  "fileserver-nord-02" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.20.30" }
  "fileserver-nord-03" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.20.31" }
  "fileserver-nord-04" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.20.32" }
  "fileserver-nord-05" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.20.33" }
  "fileserver-nord-06" = { cluster = "prod-a", cpus = 8, memory_gb = 32, ip = "10.10.20.34" }
}

ldap_servers = {
  "ldap-nord-01" = { cluster = "prod-b", cpus = 2, memory_gb = 8, ip = "10.10.30.11" }
  "ldap-nord-02" = { cluster = "prod-a", cpus = 2, memory_gb = 8, ip = "10.10.30.12" }
  "ldap-nord-03" = { cluster = "prod-b", cpus = 2, memory_gb = 8, ip = "10.10.30.13" }
  "ldap-nord-04" = { cluster = "prod-a", cpus = 2, memory_gb = 8, ip = "10.10.30.14" }
}

monitoring_servers = {
  "monitoring-nord-01" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.30.15" }
  "monitoring-nord-02" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.30.16" }
  "monitoring-nord-03" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.30.17" }
  "monitoring-nord-04" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.30.18" }
  "monitoring-nord-05" = { cluster = "prod-a", cpus = 4, memory_gb = 16, ip = "10.10.30.19" }
}
