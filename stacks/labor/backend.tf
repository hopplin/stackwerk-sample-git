terraform {
  backend "http" {
    address        = "https://scm.example.com/api/v4/projects/57/terraform/state/labor"
    lock_address   = "https://scm.example.com/api/v4/projects/57/terraform/state/labor/lock"
    unlock_address = "https://scm.example.com/api/v4/projects/57/terraform/state/labor/lock"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    username       = "tofu"
  }
}
