# Read automatically, like terraform.tfvars.
nfs_exports = {
  "nfs-backup" = { host = "10.10.30.40", path = "/export/backup" }
  "nfs-iso"    = { host = "10.10.30.41", path = "/export/iso" }
}
