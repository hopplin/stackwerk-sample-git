terraform {
  required_version = ">= 1.8.0"

  required_providers {
    # Deliberately without a version: stackwerk reports a provider that is not pinned.
    vsphere = {
      source = "vmware/vsphere"
    }
  }
}
