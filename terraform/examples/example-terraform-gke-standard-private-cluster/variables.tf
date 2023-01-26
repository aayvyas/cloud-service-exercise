variable "project_id" {
    description = "your project id"
    type = string
    default = "burner-aayvyas"
  
}

variable "authorized_cidr" {
    type = string  
    description = "a valid CIDR range ex: xxx.xxx.xxx.xxx/xx which will be authorized to talk to controlplane"
    default = "34.124.179.197/32"
}

variable "authorized_cidr_name" {
  type = string
  description = "name of the authorized cidr"
  default = "cloud-shell-ip"
}

variable "is_premptible" {
    type = bool
    description = "true for premptible instances"
    default = true
}

variable "disk_size_gb" {
    type = number
    description = "size of the disk"
    default = 10
}

variable "node_pool_name" {
    type = string
    description = "name of the node pool"
    default = "premptible-node-pool"
}

variable "node_count" { 
    type = number
    description = "node count to start"
    default = 2
}

variable "dont_enable_public_endpoint" {
    type = bool
    description = "true if you don't want a public endpoint for your master"
    default = false
}