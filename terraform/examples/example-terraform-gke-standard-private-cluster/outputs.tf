output "public_endpoint" {

    value = module.terraform-gke-standard-private-cluster.public_endpoint
  
}

output "authorized_cidr" {
    value = module.terraform-gke-standard-private-cluster.authorized_cidr
}
output "machine_type" {
    value = module.terraform-gke-standard-private-cluster.machine_type
}

output "is_premptible" {
    value = module.terraform-gke-standard-private-cluster.is_premptible
}

output "node_count" {
    value = module.terraform-gke-standard-private-cluster.node_count
  
}