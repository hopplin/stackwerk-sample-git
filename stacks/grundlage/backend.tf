terraform {
  backend "http" {
    address = "https://scm.example.com/api/v4/projects/42/terraform/state/grundlage"
  }
}
