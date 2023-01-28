resource "google_dns_managed_zone" "private-dns" {
  name        = "k8s-private-dns"
  dns_name    = var.dns_name
  description = "Private DNS for cloud-services exercise kubernetes cluster"
  labels = {

  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.network
    }
  }
}

resource "google_dns_record_set" "a" {
  name         = "${var.subdomain_name}.${google_dns_managed_zone.private-dns.dns_name}"
  managed_zone = google_dns_managed_zone.private-dns
  type         = "A"
  ttl          = 300

  rrdatas = [var.ip_address_for_dns]
}