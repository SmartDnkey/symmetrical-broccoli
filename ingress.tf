
# Create ingress to connect to teh api-rest externally. Add SSL certificate
resource "kubernetes_ingress_v1" "apirest-ingress" {
  metadata {
    name        = "apirest-ingress"
    annotations = {
      "kubernetes.io/ingress.global-static-ip-name" = "apirest-ip"
      "networking.gke.io/managed-certificates"      = google_certificate_manager_certificate.apirest-cert.name
      "kubernetes.io/ingress.class"                 = "gce"
    }
  }
  spec {
    default_backend {
      service {
        name = kubernetes_service_v1.ingress-service.metadata.0.name
        port {
          number = 443
        }
      }
    }
  }
}

# Service to connect the ingress service with the apirest deployment
resource "kubernetes_service_v1" "ingress-service" {
  metadata {
    name = "ingress-service"
    }
  spec {
    selector = {
      app = "apirest"
    }
    port {
      port        = 443
      target_port = 8000
      protocol    = "TCP"
    }
    type = "NodePort"
  }
}




