resource "google_storage_bucket" "whereami-backend" {
  name          = var.backend_gcs_name
  location      = "US"
  force_destroy = true

  versioning {
    enabled = true
  }

  labels = {
    "purpose" : "terraform-backend"
  }
}