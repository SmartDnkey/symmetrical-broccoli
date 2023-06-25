
# Create a persistent disk to be used by the postgres db
variable "postgres_name" {
}
variable "postgres_user" {
}
variable "postgres_pw" {
}


resource "google_compute_disk" "persistent_disk" {
  name  = "persistent-disk"
  size  = "10"
  zone = "europe-west2-a"

}

resource "kubernetes_persistent_volume_claim_v1" "pvc_claim" {
  metadata {
    name = "postgres-vol"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
    volume_name = kubernetes_persistent_volume_v1.postgres.metadata.0.name
    storage_class_name = "standard"
  }
}

resource "kubernetes_persistent_volume_v1" "postgres" {
  metadata {
    name = "postgres-vol"
  }
  spec {
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_reclaim_policy = "Retain"
    persistent_volume_source {
      gce_persistent_disk {
        pd_name = google_compute_disk.persistent_disk.name
      }
    }
    storage_class_name = "standard"
  }
}

# postgres deployment
resource "kubernetes_deployment" "postgres" {
  metadata {
    name = "postgres"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "postgres"
      }
    }
    template {
      metadata {
        labels = {
          app = "postgres"
        }
      }
      spec {
        container {
          image = "postgres:15"
          name  = "postgres"
          port {
            container_port = 5432
          }
          env{
            name = "POSTGRES_NAME"
            value = var.postgres_name
          }
          env{
          name = "POSTGRES_USER"
          value = var.postgres_user
          }
          env{
          name = "POSTGRES_PASSWORD"
          value = var.postgres_pw
          }

          volume_mount {
            mount_path = "/opt/app"
            name       = "postgres-vol"
          }
        }
        volume {
          name = "postgres-vol"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim_v1.pvc_claim.metadata.0.name
          }
        }
      }
    }
  }
}


# If we want to access the deployment from other deployments we need to expose it with a service
resource "kubernetes_service" "postgres_svc" {
  metadata {
    name = "postgres"
  }

  spec {
    selector = {
      app = kubernetes_deployment.postgres.spec.0.template.0.metadata.0.labels.app
    }

    port {
      target_port = 5432
      port        = 5432
    }
  }
}
