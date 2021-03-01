resource "aws_subnet" "public" {
  cidr_block = "${var.subnet_cidr}"
  vpc_id = "${var.vpc_id}"
  availability_zone = "${var.az}"

  tags = {
    Name = "${var.subnet_name}"
    Scope = "Clients"
    Purpose = "Security"
    Mode = "Automation"
  }
}



resource "aws_route_table" "public-routetable" {
  vpc_id = "${var.vpc_id}"

   tags = {
    Scope = "Clients"
    Purpose = "Security"
    Mode = "Automation"
    Name = "Public-Route"
  }
}

resource "aws_route" "public_route" {
  route_table_id = "${aws_route_table.public-routetable.id}"
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = "${var.igw_id}"

}

resource "aws_route_table_association" "association" {
  route_table_id = "${aws_route_table.public-routetable.id}"
  subnet_id = "${aws_subnet.public.id}"

}

