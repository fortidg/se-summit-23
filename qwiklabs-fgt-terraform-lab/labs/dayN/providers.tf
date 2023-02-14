terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    fortios = {
      source = "fortinetdev/fortios"
    }
  }
}

data "google_compute_instance" "fgt1" {
  self_link = data.terraform_remote_state.day0.outputs.fgt_self_links[0]
}

data "google_secret_manager_secret_version" "fgt-apikey" {
  secret  = "${data.google_compute_instance.fgt1.name}-apikey"
}

provider "fortios" {
  hostname = data.google_compute_instance.fgt1.network_interface[3].access_config[0].nat_ip
  token    = data.google_secret_manager_secret_version.fgt-apikey.secret_data
  insecure = true
}

provider "google" {
  region   = data.terraform_remote_state.day0.outputs.region
}
