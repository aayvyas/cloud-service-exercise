# GKE
resource "google_container_cluster" "k8s_cluster" {
    name = "k8s-cluster"
    location = "us-central1-a"
    initial_node_count = 2
    remove_default_node_pool = true


    # for defining the ip address of the private cluster
    ip_allocation_policy {
        cluster_ipv4_cidr_block = "10.0.0.0/21"
    }

    private_cluster_config {
        # no external ip addresses of nodes
        enable_private_nodes = true
        # disabling private endpoint, as to create a public endpoint for cloudshell, as nodes in private cluster have 2 endpoints private and public
        enable_private_endpoint = var.dont_enable_public_endpoint
        master_ipv4_cidr_block = "10.128.1.0/28"
    }


    network = var.network
    subnetwork = var.subnetwork
    
    addons_config {
        # enabling http loadbalancing
        http_load_balancing {
            disabled = false
        }
    }

    # # adding the DNS config, using the k8s-dns
    # dns_config {
    #     cluster_dns = "PLATFORM_DEFAULT"
    # }
    master_auth {
        client_certificate_config {
            issue_client_certificate = false
        }
    }   
    master_authorized_networks_config {
        

        cidr_blocks {
            cidr_block = var.authorized_cidr
            display_name = var.authorized_cidr_name
        
        }
    }
     
}

resource "google_container_node_pool" "node_pool" {
    name = var.node_pool_name
    location = "us-central1-a"
    cluster = google_container_cluster.k8s_cluster.name
    node_count = var.node_count

    node_config {
        preemptible  = var.is_premptible
        machine_type = var.machine_type
        
        disk_size_gb = var.disk_size_gb
        disk_type = "pd-standard"
    }
    
}



