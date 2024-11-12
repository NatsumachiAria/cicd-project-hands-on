data "terraform_remote_state" "dev-vpc" {
  backend = "local"
  config = {
    path = "../vpc/terraform.tfstate"
  }
}