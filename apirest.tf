variable "django_secret" {
}

# Deploying api rest application and connecting it to postgres db
resource "kubernetes_deployment" "apirest" {
  metadata {
    name = "apirest"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "apirest"
      }
    }
    template {
      metadata {
        labels = {
          app = "apirest"
        }
      }
      spec {
        container {
          image = "europe-west2-docker.pkg.dev/mythic-hulling-390415/apirest/apirest:1.2"
          name  = "apirest"
          port {
            container_port = 8000
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
          env{
          name = "SECRET_KEY"
          value = var.django_secret
          }
        }
      }
    }
  }
}
