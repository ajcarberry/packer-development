# =================================
# Development External IP space
# =================================
variable "development_external_nets" {
  description = "Trusted external IP space"
  default     = "54.226.175.67/32,136.56.168.93/32,199.255.40.17/32"
}

# =================================
# VPC and Subnet IP ranges
# =================================
variable "vpc_cidr" {
  default = {
    stage = "10.10.0.0/16"
    prod =  "10.100.0.0/16"
  }
}

variable "dmz_subnet_1_cidr" {
  default = {
    stage = "10.10.0.0/24"
    prod  = "10.100.0.0/24"
  }
}

variable "nat_subnet_1_cidr" {
  default = {
    stage = "10.10.16.0/24"
    prod  = "10.100.16.0/24"
  }
}
