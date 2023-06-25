data "google_client_config" "default" {}

variable "gcp_sa" {
  default = ""
}

provider "google" {
  project     = "mythic-hulling-390415"
  region      = "europe-west2"
  credentials = var.gcp_sa
}

provider "kubernetes" {
  host                   = "https://${google_container_cluster.default.endpoint}"
  cluster_ca_certificate = base64decode(google_container_cluster.default.master_auth.0.cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}

terraform {
  cloud {
    organization = "smartdnkey-test"

    workspaces {
      name = "apirest"
    }
  }
}