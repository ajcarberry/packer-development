terraform {
  backend "s3" {
    profile   = "default"
    region    = "us-east-1"
    bucket    = "homelab-terraform"
    key       = "development/state.tfstate"
    encrypt   = true
  }
}
