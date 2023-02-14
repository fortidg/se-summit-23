output fgt_mgmt_eips {
  value = google_compute_address.mgmt_pub[*].address
}

output fgt_password {
  value = google_compute_instance.fgt-vm[0].instance_id
}

output fgt_self_links {
  value = google_compute_instance.fgt-vm[*].self_link
}

output region {
  value = var.region
}

output internal_vpc {
  value = data.google_compute_subnetwork.subnets[1].network
}

output internal_subnet {
  value = data.google_compute_subnetwork.subnets[1].self_link
}

output api_key {
  value = random_string.api_key.result
}

output elb_bes {
    value = google_compute_region_backend_service.elb_bes.self_link
}
