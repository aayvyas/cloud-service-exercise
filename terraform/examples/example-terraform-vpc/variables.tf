variable "regions_cidr" {
    type = map
    default = {
        "us-central1" : "10.0.0.0/29",
        "us-east1" : "11.0.0.0/29"
        


    }
    description = "key: regions, value: cidr"
}
variable "vpc_name" {
    default = "example-vpc"
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
    default = ["80"]
    description = "firewall ports, (http not allowed, ssh from any source '*' or INTERNET not allowed)"
}

variable "true_private" {
    type = bool
    default = true
    description = "if you want your network to be completely private i.e. no internet access, then 'true' " 
}

variable "firewall_tags" {
    type = list
    default = ["dev"]
    description = "tags of the vm instances that you want to assign the firewall rule to"
  
}
variable "subnet_name" {
    description = "name of the subnet"
    default = "example-subnet"
  
}