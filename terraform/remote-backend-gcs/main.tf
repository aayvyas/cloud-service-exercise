resource "google_storage_bucket" "whereami-backend" {
  name          = var.backend_gcs_name
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = false
  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }

  labels = {
    "purpose" : "terraform-backend"
  }
}