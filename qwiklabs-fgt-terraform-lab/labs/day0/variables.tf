variable "region" {
  type = string
  description = "GCE region to use"
  default = "us-central1"
}

variable "prefix" {
  type = string
  description = "Prefix to be added to the names of all created resources"
  default = "qwik-fgt"
}

provider "google" {
    region = var.region
}
