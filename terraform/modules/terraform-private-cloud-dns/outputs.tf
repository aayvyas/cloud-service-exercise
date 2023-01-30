output "dns_name" {
    value = google_dns_managed_zone.private-dns.dns_name
}

output "is_private" {
    value = google_dns_managed_zone.private-dns.visibility
}

output "managed_zone" {
    value = google_dns_record_set.a.managed_zone
}

output "ip_address_for_dns" {
    value = google_dns_record_set.a.rrdatas
}

output "subdomain_name" {
    value = google_dns_record_set.a.name
  
}
