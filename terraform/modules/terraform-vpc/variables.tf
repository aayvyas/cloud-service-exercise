variable "regions_cidr" {
    type = map
    description = "key: regions, value: cidr"
}
variable "vpc_name" {
    type = string
    description = "name of the vpc"
}
variable "vpc_description" {
    type = string
    description = "vpc created using terraform module written by aayvyas" 
}

variable "tcp_ports" {
    type = list
    description = "firewall ports, (http not allowed, ssh from any source '*' or INTERNET not allowed)"
}

variable "true_private" {
    type = bool
    description = "if you want your network to be completely private i.e. no internet access, then 'true' " 
}

variable "firewall_tags" {
    type = list
    description = "tags of the vm instances that you want to assign the firewall rule to"
  
}
variable "subnet_name" {
    type = string
    description = "name of the subnet"
    
  
}