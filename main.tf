



module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "${var.vpc_cidr}"
  vpc_name = "${var.vpc_name}"
}


module "public-subnet-a" {
  source = "./modules/public-subnet"
  subnet_cidr = "${var.public_subnet_a_cidr}"
  #az = "${var.public_subnet_az_1}"
  vpc_id = "${module.vpc.vpc_id}"
  
  subnet_name = "${var.subnet_name}"
  # testing pull request
}




module "security_group" {
  source = "./modules/sg"
  vpc_id = "${module.vpc.vpc_id}"
  security_group_name = var.security_group_name
}







module "eip-1" {
  source = "./modules/eip"
  instance_id = "${module..instance_id}"
  eip_name = var._eip_name
}

module "ec2" {
  source = "./modules/ec2"
  ami_id = "${var._ami_id}"
  public_subnet = "${module.public-subnet-a.subnet_id}"
  security-group-id = "${module.security_group.public-sg-id}"
  
  server_name = "${var.server_name}"
  primary_disk_size = var.primary_disk_size
  vm_size = var._vm_size
  
}





/*module "eip-2" {
  source = "./modules/eip"
  instance_id = "${module.production.instance_id}"
  eip_name = var.prod_eip_name
}

module "production" {
  source = "./modules/ec2"
  ami_id = "${var.prod_ami_id}"
  public_subnet = "${module.public-subnet-a.subnet_id}"
  security-group-id = "${module.security_group_a.public-sg-id}"
  
  server_name = "${var.server_name_production}"
  primary_disk_size = var.primary_prod_disk_size
  vm_size = var.prod_vm_size
  
}
*/








