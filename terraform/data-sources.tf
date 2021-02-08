data "aws_route53_zone" "prod_carberry_io" {
  name         = "prod.carberry.io."
  private_zone = false
}

data "aws_ami" "development" {
  owners = [ "self" ]
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Name"
    values = ["ubuntu-development*"]
  }

  most_recent = true
}