data "google_client_config" "default" {}

variable "gcp_sa" {
  default = ""
}


provider "google" {
  project     = "mythic-hulling-390415"
  region      = "europe-west2"
  credentials = var.gcp_sa
}

terraform {
  cloud {
    organization = "smartdnkey-test"

    workspaces {
      name = "apirest"
    }
  }
}