// First, load the outputs from the day0 run so we can use them with "data.terraform_remote_state.day0.outputs"
data "terraform_remote_state" "day0" {
  backend = "local"

  config  = {
    path = "../day0/terraform.tfstate"
  }
}
