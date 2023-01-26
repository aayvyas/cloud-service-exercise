output "private_endpoint" {

    value = google_container_cluster.k8s_cluster.endpoint
  
}