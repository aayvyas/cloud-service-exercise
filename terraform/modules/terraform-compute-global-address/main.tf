resource "google_compute_global_address" "ip_address" {
  name = "ingress-static-ip"
  address_type = "EXTERNAL"
}