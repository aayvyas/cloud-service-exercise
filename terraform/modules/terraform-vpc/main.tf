resource "google_compute_network" "vpc" {
    name = var.vpc_name
    description = var.vpc_description
    routing_mode = "REGIONAL"
    auto_create_subnetworks = false
    
    delete_default_routes_on_create = var.true_private
}