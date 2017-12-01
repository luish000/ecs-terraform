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

module "internet_gateway" {
  source = "./internet-gateway"
  vpc_id = "${module.vpc.id}"
}

module "primary_public_subnet" {
  source = "./subnet"
  subnet_cidr = "${var.primary_subnet_cidr}"
  subnet_name = "${var.primary_subnet_name}"
  vpc_id = "${module.vpc.id}"
}

module "secondary_public_subnet" {
  source = "./subnet"
  subnet_cidr = "${var.secondary_subnet_cidr}"
  subnet_name = "${var.secondary_subnet_name}"
  vpc_id = "${module.vpc.id}"
}

module "sg" {
  source = "./sg"
  allow_cidr_block = "${var.allow_cidr_block}"
  allow_ipv6_cidr_block = "${var.allow_ipv6_cidr_block}"
  ecs_sg_name = "${var.ecs_sg_name}"
  vpc_id = "${module.vpc.id}"
}

module "route_table" {
  source = "./route-table"
  allow_cidr_block = "${var.allow_cidr_block}"
  internet_gateway_id = "${module.internet_gateway.id}"
  primary_subnet_id = "${module.primary_public_subnet.id}"
  secondary_subnet_id = "${module.secondary_public_subnet.id}"
  vpc_id = "${module.vpc.id}"
}

module "nacl" {
  source = "./nacl"
  allow_cidr_block = "${var.allow_cidr_block}"
  vpc_id = "${module.vpc.id}"
  primary_subnet_id = "${module.primary_public_subnet.id}"
  secondary_subnet_id = "${module.secondary_public_subnet.id}"
}


output "vpc_id" { value = "${module.vpc.id}" }

output "vpc_cidr" { value = "${module.vpc.vpc_cidr}" }

output "ecs_sg" { value = "${module.security_group.id}" }

output "primary_subnet_id" { value = "${module.primary_public_subnet.id}" }

output "secondary_subnet_id" { value = "${module.secondary_public_subnet.id}" }
