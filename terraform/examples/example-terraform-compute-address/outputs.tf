output "static_ip_address" {
  value = google_compute_address.ip_address.address
}