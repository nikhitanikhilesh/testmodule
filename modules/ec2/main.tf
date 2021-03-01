resource "aws_instance" "web" {
  ami           = "${var.ami_id}"
  instance_type = var.vm_size
  subnet_id = "${var.public_subnet}"
  vpc_security_group_ids = ["${var.security-group-id}"]
  iam_instance_profile = var.instance_profile
  key_name = "${var.key}"
  associate_public_ip_address = "true"
  user_data = "${file("././scripts/userdata.sh")}"
  root_block_device {
    volume_type = "gp2"
    volume_size = var.primary_disk_size

  }

  tags = {
    OS = "Linux"
    Scope = "Ncpl"
    Name = "${var.server_name}"
    Purpose = "Server"
    Project = "Clients"
    Mode = "Automation"
    Backup = "True"
  }  

}
