variable "prefix" {
  type = string
  description = "Prefix to be added to all created resources"
  default = "demoapp1"
}



# We'll use shortened region and zone names for some resource names. This is a standard shorting described in
# GCP security foundations.
locals {
  region_short    = replace( replace( replace( replace(data.terraform_remote_state.day0.outputs.region, "europe-", "eu"), "australia", "au" ), "northamerica", "na"), "southamerica", "sa")
}