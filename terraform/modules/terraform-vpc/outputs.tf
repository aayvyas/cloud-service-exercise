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

output "subnets" {
    value = google_compute_subnetwork.subnet
}