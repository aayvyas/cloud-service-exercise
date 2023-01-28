variable "dns_name" {

    description = "the domain name you want to use (private) , you don't have to own it"
    type = string
    default = "cloudservices.com"

}

variable "vpc_network" {

    description = "network where you want the dns to be in , kept"
    type = string
    default = "default"
  
}

variable "subdomain_name" {
    description = "subdomain name for your dns"
    type = string 
    default = "api" 
}

variable "ip_address_for_dns" {

    description = "the ip address to resolve to"
    type = string
    default = "8.8.8.8"

  
}
variable "project_id" {
    description = "your project id"
    type = string

  
}

