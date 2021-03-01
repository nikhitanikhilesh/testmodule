resource "aws_eip" "web" {
  instance = "${var.instance_id}"
  vpc      = true

  tags = {
    OS = "Linux"
    Name = var.eip_name
    
    
  }
}
