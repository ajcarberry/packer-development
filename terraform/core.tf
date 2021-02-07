module "vpc_development" {
  source    = "git::https://github.com/ajcarberry/terraform-modules//aws/vpc?ref=tf-v014-support"
  cidr      = lookup(var.vpc_cidr, terraform.workspace)
  env       = terraform.workspace
  name      = "development_vpc"
}

module "dmz_subnet_1" {
  source            = "git::https://github.com/ajcarberry/terraform-modules//aws/subnets/dmz_subnet?ref=tf-v014-support"
  vpc               = module.vpc_development.vpc_id
  vpc_name          = module.vpc_development.vpc_name
  internet_gw       = module.vpc_development.internet_gateway_id
  env               = terraform.workspace
  cidr              = lookup(var.dmz_subnet_1_cidr, terraform.workspace)
  availability_zone = "us-east-1a"
  tag               = "DMZ"
}
