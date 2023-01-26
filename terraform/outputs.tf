output "public_endpoint" {

    value = module.terraform-gke-standard-private-cluster.private_endpoint
  
}
output "static_ip_address" {
  value = module.terraform-compute-address.static_ip_address
}

output "vpc_routing_mode" {
    value = google_compute_network.vpc.routing_mode
}

output "vpc_description" {
    value = google_compute_network.vpc.description
}

output "subnet_count" {
    value = length(google_compute_subnetwork.subnet)
  
}

output "vpc_id" {
    value = google_compute_network.vpc.id
}

output "subnet_id" {
    value = google_compute_subnetwork.subnet.id
}