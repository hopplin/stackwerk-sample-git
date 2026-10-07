terraform {
  backend "http" {
    address        = "https://scm.example.com/api/v4/projects/42/terraform/state/prod-nord"
    lock_address   = "https://scm.example.com/api/v4/projects/42/terraform/state/prod-nord/lock"
    unlock_address = "https://scm.example.com/api/v4/projects/42/terraform/state/prod-nord/lock"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    username       = "tofu"
  }
}
