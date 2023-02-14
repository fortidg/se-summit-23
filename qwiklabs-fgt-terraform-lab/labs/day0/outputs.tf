# Note: while the amount of outputs below might seem excessive,
# DO NOT DELETE THEM as many are necessary to add use-case templates
# in day1 (via remote state)
#

output "primary_fgt_mgmt_ip" {
  value = "https://${module.fortigates.fgt_mgmt_eips[0]}"
}

output "default_password" {
  value = module.fortigates.fgt_password
}

#output "fgt_umigs" {
#  value = module.fortigates.fgt_umigs
#}

#output "api_key" {
#  value = module.fortigates.api_key
#}

output "region" {
  value = var.region
}

output "prefix" {
  value = var.prefix
}

output "elb_bes" {
    value = module.fortigates.elb_bes
}

#output "internal_vpc" {
#  value = module.fortigates.internal_vpc
#}

output "internal_subnet" {
  value = module.fortigates.internal_subnet
}

output "fgt_self_links" {
  value = module.fortigates.fgt_self_links
}