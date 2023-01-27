resource "google_storage_bucket" "whereami-backend" {
  name          = var.backend_gcs_name
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = false
  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }

  labels = {
    "purpose" : "terraform-backend"
  }
}

module "terraform-compute-global-address" {
  depends_on = [
    google_storage_bucket.whereami-backend
  ]
  source = "./modules/terraform-compute-global-address"
}

module "terraform-gke-standard-private-cluster" {
    depends_on = [
      module.terraform-vpc
    ]
    network = var.vpc_name
    subnetwork = "${var.vpc_name}-${var.region}-subnet"
    source = "./modules/terraform-gke-standard-private-cluster"
    authorized_cidr = var.authorized_cidr
    authorized_cidr_name = var.authorized_cidr_name
    is_premptible = var.is_premptible
    disk_size_gb = var.disk_size_gb
    node_pool_name = var.node_pool_name
    node_count = var.node_count
    dont_enable_public_endpoint = var.dont_enable_public_endpoint
    machine_type = var.machine_type
}

module "terraform-vpc" {
    depends_on = [
      google_storage_bucket.whereami-backend
    ]
    source = "./modules/terraform-vpc"
    regions_cidr = var.regions_cidr
    vpc_name = var.vpc_name
    vpc_description = var.vpc_description
    tcp_ports = var.tcp_ports
    true_private = var.true_private
    firewall_tags = var.firewall_tags
    subnet_name = var.subnet_name
}
