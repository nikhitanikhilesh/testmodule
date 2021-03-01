resource "aws_subnet" "public" {
  cidr_block = "${var.subnet_cidr}"
  vpc_id = "${var.vpc_id}"
  availability_zone = "${var.az}"

  tags = {
    Name = "${var.subnet_name}"
    
  }
}



