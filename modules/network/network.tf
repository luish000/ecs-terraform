variable "name" {}

variable "vpc_cidr" {}

variable "primary_subnet_cidr" {}

variable "primary_subnet_name" {}

variable "secondary_subnet_cidr" {}

variable "secondary_subnet_name" {}

variable "allow_cidr_block" {}

variable "allow_ipv6_cidr_block" {}

variable "ecs_sg_name" {}

module "vpc" {
  source = "./vpc"
  vpc_cidr = "${var.vpc_cidr}"
  name = "${var.name}"
}

module "internet_gateways" {
  source = "./internet-gateways"
  vpc_id = "${module.vpc.vpc_id}"
}

module "public_subnets" {
  source = "./subnets/public"
  primary_subnet_cidr = "${var.primary_subnet_cidr}"
  primary_subnet_name = "${var.primary_subnet_name}"
  secondary_subnet_cidr = "${var.secondary_subnet_cidr}"
  secondary_subnet_name = "${var.secondary_subnet_name}"
  vpc_id = "${module.vpc.vpc_id}"
}

module "security_groups" {
  source = "./security-groups"
  allow_cidr_block = "${var.allow_cidr_block}"
  allow_ipv6_cidr_block = "${var.allow_ipv6_cidr_block}"
  ecs_sg_name = "${var.ecs_sg_name}"
  vpc_id = "${module.vpc.vpc_id}"
}

module "route_tables" {
  source = "./route-tables"
  allow_cidr_block = "${var.allow_cidr_block}"
  internet_gateway_id = "${module.internet_gateways.internet_gateway_id}"
  primary_subnet_id = "${module.public_subnets.primary_subnet_id}"
  secondary_subnet_id = "${module.public_subnets.secondary_subnet_id}"
  vpc_id = "${module.vpc.vpc_id}"
}

module "nacl" {
  source = "./nacl"
  allow_cidr_block = "${var.allow_cidr_block}"
  vpc_id = "${module.vpc.vpc_id}"
  primary_subnet_id = "${module.public_subnets.primary_subnet_id}"
  secondary_subnet_id = "${module.public_subnets.secondary_subnet_id}"
}


output "vpc_id" { value = "${module.vpc.vpc_id}" }

output "vpc_cidr" { value = "${module.vpc.vpc_cidr}" }

output "ecs_sg" { value = "${module.security_groups.sg_id}" }

output "primary_subnet_id" { value = "${module.public_subnets.primary_subnet_id}" }

output "secondary_subnet_id" { value = "${module.public_subnets.secondary_subnet_id}" }
