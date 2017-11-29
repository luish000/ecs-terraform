variable "main_ag_name" { default = "main" }
variable "main_ag_max_instances" {}
variable "main_ag_min_instances" {}
variable "main_ag_desired_capacity" {}
variable "main_launch_configuration_name" {}

resource "aws_autoscaling_group" "main_ag" {
  name = "${var.main_ag_name}"
  max_size = "${var.main_ag_max_instances}"
  min_size = "${var.main_ag_min_instances}"
  desired_capacity = "${var.main_ag_desired_capacity}"
  vpc_zone_identifier = ["${var.primary_subnet_id}", "${var.secondary_subnet_id}"]
  launch_configuration = "${var.main_launch_configuration_name}"
  health_check_type = "EC2"
}
