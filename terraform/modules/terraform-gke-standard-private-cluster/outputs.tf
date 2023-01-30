output "public_endpoint" {

    value = google_container_cluster.k8s_cluster.endpoint
  
}

output "authorized_cidr" {
    value = google_container_cluster.k8s_cluster.master_authorized_networks_config[0].cidr_blocks["cidr_block"]
}
output "machine_type" {
    value = google_container_node_pool.node_pool.node_config[0].machine_type
}

output "is_premptible" {
    value = google_container_node_pool.node_pool.node_config[0].preemptible
}

output "node_count" {
    value = google_container_node_pool.node_pool.node_count
}

