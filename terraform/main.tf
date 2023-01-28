resource "google_compute_instance" "test-vm" {

  depends_on = [
    module.terraform-gke-standard-private-cluster
  ]

  name = "test-vm"

  tags = var.firewall_tags

  machine_type = "f1-micro"

  network_interface {
    network = var.vpc_name
    subnetwork = var.subnet_name

  }
  boot_disk {

    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
}
module "terraform-compute-global-address" {
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
    source = "./modules/terraform-vpc"
    regions_cidr = var.regions_cidr
    vpc_name = var.vpc_name
    vpc_description = var.vpc_description
    tcp_ports = var.tcp_ports
    true_private = var.true_private
    firewall_tags = var.firewall_tags
    subnet_name = var.subnet_name
}

data "google_compute_network" "network" {
  depends_on = [
    module.terraform-vpc
  ]
  name = var.vpc_name
}
module "terraform-private-cloud-dns" {
  depends_on = [
    module.terraform-vpc
  ]
  source = "./modules/terraform-private-cloud-dns"
  dns_name = "cloudservices.com"
  vpc_network = data.google_compute_network.network
  subdomain_name = "api"
  ip_address_for_dns = module.terraform-compute-global-address.static_ip_address
}