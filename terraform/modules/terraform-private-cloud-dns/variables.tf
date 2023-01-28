variable "dns_name" {

    description = "the domain name you want to use (private) , you don't have to own it"
    type = string

}

variable "vpc_network" {

    description = "network where you want the dns to be in , kept"
    type = string
  
}

variable "subdomain_name" {
    description = "subdomain name for your dns"
    type = string  
}

variable "ip_address_for_dns" {

    description = "the ip address to resolve to"
    type = string

  
}