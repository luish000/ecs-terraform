variable "name" {}
variable "max_instances" {}
variable "min_instances" {}
variable "desired_capacity" {}
variable "launch_configuration" {}
variable "subnets" {
  type = "list"
}

module "aws_autoscaling_group" "ag" {
  name = "${var.name}"
  max_size = "${var.max_instances}"
  min_size = "${var.min_instances}"
  desired_capacity = "${var.desired_capacity}"
  vpc_zone_identifier = ["${var.subnets}"]
  launch_configuration = "${var.launch_configuration}"
  health_check_type = "EC2"
}
