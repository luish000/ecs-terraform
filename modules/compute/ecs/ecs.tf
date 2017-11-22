# Network vars
variable "main_alb_sg" {}
variable "primary_subnet_id" {}
variable "secondary_subnet_id" {}
variable "vpc_id" {}

# Ecs cluster vars
variable "main_cluster_name" { default = "ecs_cluster" }

# Auto scaling groups vars
variable "main_ag_max_instances" { default = "1" }
variable "main_ag_min_instances" { default = "1" }
variable "main_ag_desired_capacity" { default = "1" }

# Launch configurations vars
variable "main_launch_configuration_name" { default = "ecs_launch_configuration" }
variable "main_image_id" {}
variable "main_instance_type" {}

# iam vars
variable "default_iam_profile" {}


# Load balancers module
module "load_balancers" {
  source = "./albs"
  main_alb_sg = "${var.main_alb_sg}"
  primary_subnet_id = "${var.primary_subnet_id}"
  secondary_subnet_id = "${var.secondary_subnet_id}"
  vpc_id = "${var.vpc_id}"
  main_tg_arn = "${module.tgs.main_tg_arn}"
  main_alb_arn = "${module.load_balancers.main_alb_arn}"
}

# Cluster module
module "clusters" {
  source = "./clusters"
  cluster_name = "${var.main_cluster_name}"
}

# Ecs instances module
module "instances" {
  source = "./instances"
  main_launch_configuration_name = "${var.main_launch_configuration_name}"
  main_image_id = "${var.main_image_id}"
  main_instance_type = "${var.main_instance_type}"
  main_ag_max_instances = "${var.main_ag_max_instances}"
  main_ag_min_instances = "${var.main_ag_min_instances}"
  main_ag_desired_capacity = "${var.main_ag_desired_capacity}"
  primary_subnet_id = "${var.primary_subnet_id}"
  secondary_subnet_id = "${var.secondary_subnet_id}"
  default_iam_profile = "${var.default_iam_profile}"
}
