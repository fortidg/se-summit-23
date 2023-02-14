
variable "prefix" {
  type = string
  description = "Prefix to be added to all created resources"
  default = "xp22"
}

variable "region" {
  type = string
  default = "europe-west1"
}

variable "subnet" {
  type = string
  description = "URI of the subnet to deploy app resources to"
}
