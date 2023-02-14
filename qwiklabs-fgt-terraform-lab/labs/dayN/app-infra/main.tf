resource "google_compute_instance" "websrv" {
  name = "${var.prefix}-websrv"
  machine_type = "e2-standard-2"
  zone = "${var.region}-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    subnetwork = var.subnet
  }

  metadata_startup_script = file("${path.module}/startup_script.sh")

  metadata = {
    app-code = filebase64("../webapp/app.tar.gz")
  }
}
