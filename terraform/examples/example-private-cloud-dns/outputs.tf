output "dns_name" {
    value = module.terraform-private-cloud-dns.dns_name
}

output "is_private" {
    value = module.terraform-private-cloud-dns.is_private
}

output "managed_zone" {
    value = module.terraform-private-cloud-dns.managed_zone
}

output "ip_address_for_dns" {
    value = module.terraform-private-cloud-dns.ip_address_for_dns
}

output "subdomain_name" {
    value = module.terraform-private-cloud-dns.subdomain_name
  
}
