module "terraform-gke-standard-private-cluster" {
    source = "../../modules/terraform-gke-standard-private-cluster"
    authorized_cidr = var.authorized_cidr
    is_premptible = var.is_premptible
    disk_size_gb = var.disk_size_gb
    node_pool_name = var.node_pool_name
    node_count = var.node_count
    dont_enable_public_endpoint = var.dont_enable_public_endpoint
}