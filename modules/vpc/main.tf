module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.vpc_name}"
  cidr = "${var.vpc_cidr}"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"
  enable_nat_gateway = "true"

tags = {
    Name = "${var.vpc_name}"
    
  }
}

