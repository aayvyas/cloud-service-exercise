# For a map of regions specified in variables , creates subnetworks accordingly
resource "google_compute_subnetwork" "subnet" {
    
    for_each = var.regions_cidr
    name = "${var.vpc_name}-${each.key}-subnet"
    region = each.key
    ip_cidr_range = each.value

    network = google_compute_network.vpc.self_link
  
}