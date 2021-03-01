variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnet_a_cidr" {}
variable "public_subnet_b_cidr" {}

variable "public_subnet_az_1" {}
variable "public_subnet_az_2" {}
variable "security_group_name_production" {}

variable "server_name_production" {}
variable "server_name_stagging" {}
variable "secondary_stagging_disk" {}
variable "secondary_prod_disk" {}
variable "subnet_name_stagging" {}
variable "subnet_name_prod" {}
variable "security_group_name_stagging" {}
variable "stagging_ami_id" {}
variable "primary_stagging_disk_size" {}
#variable "s3_bucket_name" {}
variable "primary_prod_disk_size" {}
variable "prod_ami_id" {}
variable "stagging_vm_size" {}
variable "prod_vm_size" {}
variable "stagging_eip_name" {}
variable "prod_eip_name" {}
variable "access_keys" {}
variable "secret_keys" {}
/*variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}*/
variable "region" {}