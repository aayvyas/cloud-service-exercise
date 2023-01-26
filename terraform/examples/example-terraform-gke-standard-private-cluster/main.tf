resource "google_compute_network" "test_vpc" {
    name = "test-vpc"
    description = "just for testing the private cluster"
    auto_create_subnetworks = false

}
resource "google_compute_subnetwork" "test_subnet" {
    name = "test-subnet"
    description = "just for testing the private cluster"
    network = google_compute_network.test_vpc.self_link
    ip_cidr_range = "10.0.0.0/14"
}
module "terraform-gke-standard-private-cluster" {
    depends_on = [
      google_compute_network.test_vpc
    ]
    network = google_compute_network.test_vpc.self_link
    source = "../../modules/terraform-gke-standard-private-cluster"
    authorized_cidr = var.authorized_cidr
    authorized_cidr_name = var.authorized_cidr_name
    is_premptible = var.is_premptible
    disk_size_gb = var.disk_size_gb
    node_pool_name = var.node_pool_name
    node_count = var.node_count
    dont_enable_public_endpoint = var.dont_enable_public_endpoint
    machine_type = var.machine_type
}