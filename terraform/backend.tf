terraform {
 backend "gcs" {
   bucket  = "burner-aayvyas-remote-backend"
   prefix  = "terraform/state"
 }
}