module "terraform-private-cloud-dns" {

    source = "../../modules/terraform-private-cloud-dns"
    dns_name = var.dns_name
    vpc_network = var.vpc_network
    subdomain_name = var.subdomain_name
    ip_address_for_dns = var.ip_address_for_dns
  
}