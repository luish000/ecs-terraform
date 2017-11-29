# Launch configurations vars
variable "main_image_id" {}
variable "main_instance_type" {}
variable "main_launch_configuration_name" { default = "ecs" }

# Autoscaling groups vars
variable "main_ag_max_instances" {}
variable "main_ag_min_instances" {}
variable "main_ag_desired_capacity" {}

# Network vars
variable "primary_subnet_id" {}
variable "secondary_subnet_id" {}
variable "main_sg" {}

variable "default_iam_profile" {}

variable "cluster_name" {}

module "launch_configurations" {
  source = "./launch-configurations"
  default_iam_profile = "${var.default_iam_profile}"
  main_instance_type = "${var.main_instance_type}"
  main_sg = "${var.main_sg}"
  main_image_id = "${var.main_image_id}"
  cluster_name = "${var.cluster_name}"
  main_launch_configuration_name = "${var.main_launch_configuration_name}"
}

module "autoscaling_groups" {
  source = "./autoscaling-groups"
  primary_subnet_id = "${var.primary_subnet_id}"
  secondary_subnet_id = "${var.secondary_subnet_id}"
  main_ag_max_instances = "${var.main_ag_max_instances}"
  main_ag_min_instances = "${var.main_ag_min_instances}"
  main_ag_desired_capacity = "${var.main_ag_desired_capacity}"
  main_launch_configuration_name = "${module.launch_configurations.main_launch_configuration_name}"
}
