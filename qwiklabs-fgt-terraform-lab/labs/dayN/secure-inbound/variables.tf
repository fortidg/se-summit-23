variable "prefix" {
  type        = string
  description = "Prefix to prepend to all cloud resource names"
}

variable "protocol" {
  type        = string
  description = "Protocol name to set DNAT for"
}

variable "port" {
  type        = number
  description = "Port number to forward"
}

variable "target_ip" {
  type        = string
  description = "Private IP address of the server receiving the connections"
}

variable "target_port" {
  type        = number
  description = "Port number to redirect the traffic to (usually the same as 'port')"
}

variable "region" {
  type        = string
  description = "Region to deploy solution to. Usually the same as for firewalls"
}

variable "elb_bes" {
  type = string 
  description = "URI of backend service used in the external netowrk load balancer"
}
