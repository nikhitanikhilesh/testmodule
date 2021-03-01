/*module "cert" {
  source = "./modules/acm"
  domain_name = "${var.domain_name}"
}*/

module "s3_access" {
  source = "./modules/iam"
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "${var.vpc_cidr}"
  vpc_name = "${var.vpc_name}"
}

module "igw" {
  source = "./modules/igw"
  vpc_id = "${module.vpc.vpc_id}"
  igw_name = "ncpl-clients-igw"
}
module "public-subnet-a" {
  source = "./modules/public-subnet"
  subnet_cidr = "${var.public_subnet_a_cidr}"
  az = "${var.public_subnet_az_1}"
  vpc_id = "${module.vpc.vpc_id}"
  igw_id = "${module.igw.igw_id}"
  subnet_name = "${var.subnet_name_stagging}"
}

module "public-subnet-b" {
  source = "./modules/public-subnet"
  subnet_cidr = "${var.public_subnet_b_cidr}"
  az = "${var.public_subnet_az_2}"
  vpc_id = "${module.vpc.vpc_id}"
  igw_id = "${module.igw.igw_id}"
  subnet_name = "${var.subnet_name_prod}"
}


module "security_group" {
  source = "./modules/sg"
  vpc_id = "${module.vpc.vpc_id}"
  security_group_name_stagging = var.security_group_name_stagging
}


module "key-pair" {
  source = "./modules/data"
}


module "key" {
  source = "./modules/keypair"
  key_file = module.key-pair.key_value
}

module "eip-1" {
  source = "./modules/eip"
  instance_id = "${module.stagging.instance_id}"
  eip_name = var.stagging_eip_name
}

module "stagging" {
  source = "./modules/ec2"
  ami_id = "${var.stagging_ami_id}"
  public_subnet = "${module.public-subnet-a.subnet_id}"
  security-group-id = "${module.security_group.public-sg-id}"
  key = "${module.key.key_name}"
  server_name = "${var.server_name_stagging}"
  primary_disk_size = var.primary_stagging_disk_size
  vm_size = var.stagging_vm_size
  instance_profile = module.s3_access.s3_access
}

module "ebs-stagging" {
  source = "./modules/ebs"
  availabilityzone = var.public_subnet_az_1
  data_disk_size = "${var.secondary_stagging_disk}"
  instance_id = module.stagging.instance_id
  instance_name = "${var.server_name_stagging}"
  ebs_name =  "${var.server_name_stagging}-data-disk"
}


module "security_group_a" {
  source = "./modules/sg-1"
  vpc_id = "${module.vpc.vpc_id}"
  security_group_name_production = var.security_group_name_production
}

module "eip-2" {
  source = "./modules/eip"
  instance_id = "${module.production.instance_id}"
  eip_name = var.prod_eip_name
}

module "production" {
  source = "./modules/ec2"
  ami_id = "${var.prod_ami_id}"
  public_subnet = "${module.public-subnet-a.subnet_id}"
  security-group-id = "${module.security_group_a.public-sg-id}"
  key = "${module.key.key_name}"
  server_name = "${var.server_name_production}"
  primary_disk_size = var.primary_prod_disk_size
  vm_size = var.prod_vm_size
  instance_profile = module.s3_access.s3_access
}

module "ebs-production" {
  source = "./modules/ebs"
  availabilityzone = var.public_subnet_az_2
  data_disk_size = "${var.secondary_prod_disk}"
  instance_id = module.production.instance_id
  instance_name = "${var.server_name_production}"
  ebs_name = "${var.server_name_production}-data-disk"
}



module "dlm" {
  source = "./modules/dlm"
}

module "api" {
  source = "./modules/api"
  api_name = "ncpl-clients-api"
}

module "bs" {
  source = "./modules/beanstalk"
  application_name = "ncpl-clients-bs"
}
