module "terraform-vpc" {
    source = "../../modules/terraform-vpc"
    regions_cidr = var.regions_cidr
    vpc_name = var.vpc_name
    vpc_description = var.vpc_description
    tcp_ports = var.tcp_ports
    true_private = var.true_private
    firewall_tags = var.firewall_tags
    subnet_name = var.subnet_name
}
