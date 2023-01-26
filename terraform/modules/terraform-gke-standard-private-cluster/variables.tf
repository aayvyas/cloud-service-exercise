variable "authorized_cidr" {
    type = string  
    description = "a valid CIDR range ex: xxx.xxx.xxx.xxx/xx which will be authorized to talk to controlplane"
}

variable "is_premptible" {
    type = bool
    description = "true for premptible instances"
}

variable "disk_size_gb" {
    type = number
    description = "size of the disk"
}

variable "node_pool_name" {
    type = string
    description = "name of the node pool"
}

variable "node_count" { 
    type = number
    description = "node count to start"
}

variable "dont_enable_public_endpoint" {
    type = bool
    description = "true if you don't want a public endpoint for your master"
}
variable "authorized_cidr_name" {
    type = string
    description = "name of the authorized cidr"
  
}
variable "machine_type" {
    type = string
    description = "machine type for node"
}
variable "network" {
    type = string
    description = "vpc network in which you want your cluster to be"
}

variable "subnetwork" {
    type = string
    description = "vpc subnet in which you want your cluster to be"
}
