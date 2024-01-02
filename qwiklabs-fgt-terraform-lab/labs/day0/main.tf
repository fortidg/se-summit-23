# Auto-discover custom service account
# Use service_account_create.sh to create recommended minimal privileges service
# account. If not found the default Compute Engine account will be used.
# data google_service_account fgt {
#   account_id      = "fortigatesdn-ro"
# }

# Auto-detect your own IP address to add it to the API trusthost list in FortiGate configuration
data "http" "my_ip" {
  url             = "http://api.ipify.org"
}

# Enable Secret Manager API
resource "google_project_service" "secretmanager" {
  service = "secretmanager.googleapis.com"
}

# Create base deployment of FortiGate HA cluster
module "fortigates" {
  source          = "./fgcp-ha-ap-lb"

  prefix          = "${var.prefix}-"
  region          = var.region
  # service_account = data.google_service_account.fgt.email != null ? data.google_service_account.fgt.email : ""
  healthcheck_port = 8008
  admin_acl       = ["0.0.0.0/0"]
  api_acl         = ["${data.http.my_ip.body}/32"]

  # Use the below subnet names if you create new networks using sample_networks or update to your own
  # Remember to use subnet list as names, not selfLinks
  subnets         = [ for sb in module.sample_networks.subnets : reverse( split("/", sb))[0] ]

  fgt_config = <<EOF
config firewall policy
  edit 0
    set name "allow-all-outbound"
    set srcintf "port2"
    set dstintf "port1"
    set action accept
    set srcaddr "all"
    set dstaddr "all"
    set schedule "always"
    set service "ALL"
    set utm-status enable
    set ssl-ssh-profile "certificate-inspection"
    set application-list "default"
    set logtraffic all
    set nat enable
end
EOF

  # If creating sample VPC Networks in the same configuration - wait for them to be created!
  # Remove this explicit dependency if using your own pre-existing networks.
  depends_on    = [
    module.sample_networks
  ]
}

## Remove the block below if you're using your own networks
module "sample_networks" {
  source          = "./sample-networks"

  prefix          = var.prefix
  region          = var.region
  networks        = ["external", "internal", "hasync", "mgmt"]
}
