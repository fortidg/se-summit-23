resource "google_compute_address" "inbound" {
  name                  = "${var.prefix}-eip"
  region                = var.region
}

resource "google_compute_forwarding_rule" "inbound" {
  name                  = "${var.prefix}-frule-${lower(var.protocol)}${var.port}"
  region                = var.region
  ip_address            = google_compute_address.inbound.address
  ports                 = [var.port]
  ip_protocol           = var.protocol
  load_balancing_scheme = "EXTERNAL"
  backend_service       = var.elb_bes
}
