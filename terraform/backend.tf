terraform {
 backend "gcs" {
   bucket  = "whereami-backend-terraform"
   prefix  = "terraform/state"
 }
}