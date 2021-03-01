resource "aws_instance" "web" {
  ami           = "${var.ami_id}"
  instance_type = var.vm_size
  subnet_id = "${var.public_subnet}"
  vpc_security_group_ids = ["${var.security-group-id}"]
  
  
  associate_public_ip_address = "true"
  
  root_block_device {
    volume_type = "gp2"
    volume_size = var.primary_disk_size

  }

  tags = {
    OS = "Linux"
    
    Name = "${var.server_name}"
    
  }  

}
