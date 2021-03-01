region = "ca-central-1"

vpc_name = "ncpl-corpclients-vpc"
vpc_cidr = "10.0.0.0/16"

subnet_name_stagging = "ncpl-corpclients-staging-subnet"
public_subnet_a_cidr = "10.0.0.0/24"
public_subnet_az_1 = "ca-central-1a"

subnet_name_prod = "ncpl-corpclients-prod-subnet"
public_subnet_b_cidr = "10.0.1.0/24"
public_subnet_az_2 = "ca-central-1a"

security_group_name_stagging = "ncpl-corpclients-staging-nsg"
stagging_ami_id= "ami-065ba2b6b298ed80f"
server_name_stagging = "ncpl-clients-staging-vm"
primary_stagging_disk_size ="20"
secondary_stagging_disk = "200"
stagging_vm_size = "t2.medium"
stagging_eip_name = "ncpl-clients-staging-ip"

server_name_production = "ncpl-clients-prod-vm"
security_group_name_production = "ncpl-corpclients-prod-nsg"
secondary_prod_disk = "100"
primary_prod_disk_size = "20"
prod_ami_id = "ami-065ba2b6b298ed80f"
prod_vm_size = "t2.medium"
prod_eip_name = "ncpl-clients-prod-ip"


