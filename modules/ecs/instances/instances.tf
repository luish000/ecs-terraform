# Launch configurations vars
variable "main_launch_configuration_name" {}
variable "main_image_id" {}
variable "main_instance_type" {}

# Autoscaling groups vars
variable "main_ag_max_instances" {}
variable "main_ag_min_instances" {}
variable "main_ag_desired_capacity" {}

# Network vars
variable "primary_subnet_id" {}
variable "secondary_subnet_id" {}


module "launch_configurations" {
  source = "./launch-configurations"
  default_iam_profile = "${var.default_iam_profile}"
  main_instance_type = "${var.main_instance_type}"
  main_sg = "${var.main_sg}"
}

module "autoscaling_groups" {
  source = "./autoscaling-groups"
  primary_subnet_id = "${var.primary_subnet_id}"
  secondary_subnet_id = "${var.secondary_subnet_id}"
  main_ag_max_instances = "${var.main_ag_max_instances}"
  main_ag_min_instances = "${var.main_ag_min_instances}"
  main_ag_desired_capacity = "${var.main_ag_desired_capacity}"
}
