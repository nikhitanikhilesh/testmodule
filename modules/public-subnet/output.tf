output "subnet_id" {
  value = "${aws_subnet.public.id}"
}

output "subnet_cidr_block" {
  value = "${aws_subnet.public.cidr_block}"
}