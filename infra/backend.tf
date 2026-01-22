terraform {
  backend "s3" {
    name    = "terraform-state-joaolima"
    key     = "infra/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
