locals {
  firewall_name = format("%s-%s", var.vpc_name, "-firewall")
}


resource "google_compute_firewall" "name" {

    network = google_compute_network.vpc.self_link

    name = local.firewall_name

    allow {
        protocol = "tcp"
        ports = var.tcp_ports
    }

    target_tags = var.firewall_tags
  
}