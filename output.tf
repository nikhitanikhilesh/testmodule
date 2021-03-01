output "stagging_ip" {
  value = "${module.eip-1.eip}"
}

output "production_ip" {
  value = "${module.eip-2.eip}"
}