# Create a managed certificate by google
resource "google_certificate_manager_certificate" "apirest-cert" {
  name        = "apirest-cert"
  description = "SSL cert for api-rest app"
  managed {
    domains = [
      "apirest-gke.niltorres.xyz"
      ]
  }
}
