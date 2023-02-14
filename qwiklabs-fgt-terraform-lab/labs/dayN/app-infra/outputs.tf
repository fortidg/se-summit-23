output "app_ip" {
  value = google_compute_instance.websrv.network_interface[0].network_ip
}
