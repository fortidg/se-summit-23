//The application itself
module "app" {
  source       = "./app-infra"

  prefix       = "${var.prefix}"
  subnet       = data.terraform_remote_state.day0.outputs.internal_subnet
  region       = data.terraform_remote_state.day0.outputs.region
}

//Forward traffic to the app
module "secure_inbound" {
  source       = "./secure-inbound"

  prefix       = "${var.prefix}"
  protocol     = "TCP"
  port         = 80
  target_ip    = module.app.app_ip
  target_port  = 80

  region       = data.terraform_remote_state.day0.outputs.region
  elb_bes      = data.terraform_remote_state.day0.outputs.elb_bes
}

output application_url {
    value = "http://${module.secure_inbound.application_ip}"
    description = "Public URL of the deployed demo application"
}
