variable "sg" {}
variable "autoscaling_group_name" {}
variable "launch_configuration_name" {}
variable "sg" {}
variable "subnets" {}
variable "instance_profile" {}
variable "key_pair" {}
variable "cluster_name" {}
variable "instance_type" {}
variable "ami" {}
variable "vpc" {}
variable "max_instances" {}
variable "min_instances" {}
variable "desired_capacity" {}

module "ec2" {
  source = "./ec2"
  autoscaling_group_name = "${var.autoscaling_group_name}"
  launch_configuration_name = "${var.launch_configuration_name}"
  sg = "${var.sg}"
  subnets = "${var.subnets}"
  instance_profile = "${var.instance_profile}"
  key_pair = "${var.key_pair}"
  cluster_name = "${var.cluster_name}"
  instance_type = "${var.instance_type}"
  ami = "${var.ami}"
  max_instances = "${var.max_instances}"
  min_instances = "${var.min_instances}"
  desired_capacity = "${var.desired_capacity}"
}

module "balancer" {
  source = "./balancer"
  sg = "${var.sg}"
  subnets = "${var.subnets}"
  vpc = "${var.vpc}"
}
