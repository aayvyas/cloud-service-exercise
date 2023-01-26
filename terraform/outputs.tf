output "public_endpoint" {

    value = module.terraform-gke-standard-private-cluster.private_endpoint
  
}
output "static_ip_address" {
  value = module.terraform-compute-address.static_ip_address
}

output "vpc_id" {
    value = module.terraform-vpc.vpc_id
}

output "subnet_id" {
    value = module.terraform-vpc.subnet_id
}