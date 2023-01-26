# GKE
resource "google_container_cluster" "k8s_cluster" {
    name = "k8s-cluster"
    location = var.zone
    initial_node_count = 1
    remove_default_node_pool = true


    # for defining the ip address of the private cluster
    ip_allocation_policy {
        cluster_ipv4_cidr_block = "20.0.0.0/21"
    }

    private_cluster_config {
        # no external ip addresses of nodes
        enable_private_nodes = true
        # disabling private endpoint, as to create a public endpoint for cloudshell, as nodes in private cluster have 2 endpoints private and public
        enable_private_endpoint = var.enable_public_endpoint
        master_ipv4_cidr_block = "10.1.1.0/28"
    }

    // specifying the custom vpc network
    /* TODO
        add self link to  VPC
     */
    network = "my-test-vpc"
    
    addons_config {
        # enabling http loadbalancing
        http_load_balancing {
            disabled = false
        }
    }

    # adding the DNS config, using the k8s-dns
    dns_config {
        cluster_dns = "PLATFORM_DEFAULT"
    }
    master_auth {
        client_certificate_config {
            issue_client_certificate = false
        }
    }   
    master_authorized_networks_config {
        

        cidr_blocks {
            cidr_block = "34.124.179.197/32"
            display_name = "cloud-shell"
        
        }
    }
     
}

resource "google_container_node_pool" "node_pool" {
    name = var.node_pool_name
    location = var.zone
    cluster = google_container_cluster.k8s_cluster.name
    node_count = var.node_count

    node_config {
        preemptible  = var.is_premptible
        machine_type = var.machine-type
        
        disk_size_gb = var.disk_size_gb
        disk_type = "pd-standard"
    }
    
}



