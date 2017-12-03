# Autoscaling group variables
variable "autoscaling_group_name" {}
variable "max_instances" {}
variable "min_instances" {}
variable "desired_capacity" {}
variable "subnets" { type = "list" }

# Launch configuration variables
variable "launch_configuration_name" {}
variable "ami" {}
variable "instance_type" {}
variable "key_pair" {}
variable "instance_profile" {}
variable "cluster_name" {}
variable "sg" {}

module "lc" {
  source = "./lc"
  name = "${var.launch_configuration_name}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_pair = "${var.key_pair}"
  instance_profile = "${var.instance_profile}"
  sg = "${var.sg}"
  user_data = "${template_file.data.rendered}"
}

module "ag" {
  source = "./ag"
  name = "${var.autoscaling_group_name}"
  max_instances = "${var.max_instances}"
  min_instances = "${var.min_instances}"
  desired_capacity = "${var.desired_capacity}"
  launch_configuration = "${module.lc.name}"
  subnets = ["${var.subnets}"]
}

resource "template_file" "data" {
  template = "${file("${path.module}/templates/user_data.tpl")}"
  vars { ecs-cluster-name = "${var.cluster_name}" }
}
