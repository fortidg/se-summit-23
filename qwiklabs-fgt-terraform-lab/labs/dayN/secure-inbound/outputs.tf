output "application_ip" {
  value = google_compute_address.inbound.address
}
