output "public_endpoint" {

    value = module.terraform-gke-standard-private-cluster.public_endpoint
  
}
output "static_ip_address" {
  value = module.terraform-compute-global-address.static_ip_address
}

