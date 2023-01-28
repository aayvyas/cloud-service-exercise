variable "region" {
    type = string
    default = "us-central1"
    description = "region where you want the cluster to be in"
}

variable "regions_cidr" {
    type = map
    default = {
        "us-central1" : "10.0.0.0/14",
    }
    description = "key: regions, value: cidr"
}
variable "vpc_name" {
    default = "kubernetes-vpc"
    type = string
    description = "name of the vpc"
}
variable "vpc_description" {
    default = "vpc created using terraform module written by aayvyas"
    type = string
    description = "enter the description for the vpc" 
}

variable "tcp_ports" {
    type = list
    default = ["80","22","443"]
    description = "firewall ports, (http not allowed, ssh from any source '*' or INTERNET not allowed)"
}

variable "true_private" {
    type = bool
    default = false
    description = "if you want your network to be completely private i.e. no internet access, then 'true' " 
}

variable "firewall_tags" {
    type = list
    default = ["dev", "kubernetes"]
    description = "tags of the vm instances that you want to assign the firewall rule to"
  
}
variable "subnet_name" {
    description = "name of the subnet"
    default = "kubernetes-subnet"
  
}

variable "project_id" {
    description = "your project id"
    type = string
}


### gke-variables ### 
variable "authorized_cidr" {
    type = string  
    description = "a valid CIDR range ex: xxx.xxx.xxx.xxx/xx which will be authorized to talk to controlplane"
}

variable "authorized_cidr_name" {
  type = string
  description = "name of the authorized cidr"
  default = "cloud-shell-ip"
}

variable "is_premptible" {
    type = bool
    description = "true for premptible instances"
    default = false
}

variable "disk_size_gb" {
    type = number
    description = "size of the disk"
    default = 10
}

variable "node_pool_name" {
    type = string
    description = "name of the node pool"
    default = "node-pool"
}

variable "node_count" { 
    type = number
    description = "node count to start"
    default = 1
}

variable "dont_enable_public_endpoint" {
    type = bool
    default = false
    description = "true if you don't want a public endpoint for your master"
}
variable "machine_type" {
    type = string
    description = "machine type for node"
    default = "e2-micro"
}


## compute address
## No variables
