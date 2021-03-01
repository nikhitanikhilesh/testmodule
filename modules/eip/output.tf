output "eip" {
  value = "${aws_eip.web.public_ip}"
}