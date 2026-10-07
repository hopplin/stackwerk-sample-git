locals {
  # One entry per host: "prod-a-01" => { cluster = "prod-a", rack = "R01" }
  hosts = merge([
    for cluster, spec in var.clusters : {
      for number in range(1, spec.hosts + 1) :
      format("%s-%02d", cluster, number) => { cluster = cluster, rack = spec.rack }
    }
  ]...)

  host_domain = "esx.example.com"
  vm_folders  = toset(var.folders)
}
