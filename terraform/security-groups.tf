# =================================
# Security groups
# =================================

# =================================
# ICMP only SG
# =================================
resource "aws_security_group" "sg_icmp" {
  name        = "sg_icmp"
  description = "A SG allowing only ICMP access"
  vpc_id      = module.vpc_development.vpc_id

  tags = {
    Name = "icmp_only"
    Env  = terraform.workspace
    VPC  = module.vpc_development.vpc_name
    Automation = "terraform"
  }

  ingress {
    protocol  = "icmp"
    from_port = -1
    to_port   = -1
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

# =================================
# External Protected SG
# =================================
resource "aws_security_group" "sg_external_protected" {
  name        = "sg_external_protected"
  description = "Full access from controlled external IP space."
  vpc_id      = module.vpc_development.vpc_id

  tags = {
    Name = "external_protected"
    Env  = terraform.workspace
    VPC  = module.vpc_development.vpc_name
    Automation = "terraform"
  }

  ingress {
    protocol  = "-1"
    from_port = 0
    to_port   = 0
    cidr_blocks = split(",",var.development_external_nets)
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# =================================
# Default SG
# =================================
resource "aws_security_group" "sg_development_default" {
  name        = "sg_development_default"
  description = "Full access only from other members of this"
  vpc_id      = module.vpc_development.vpc_id

  tags = {
    Name = "development_default"
    Env  = terraform.workspace
    VPC  = module.vpc_development.vpc_name
    Automation = "terraform"
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    self = true
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
