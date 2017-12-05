# Configure the AWS Provider
provider "aws" {
  region = "${var.region}"
}

module "iam" {
  source = "../../../modules/aws/iam"
}

module "network" {
  source = "../../../modules/aws/network"
  name = "${var.name}"
  vpc_cidr = "${var.vpc_cidr}"
  primary_subnet_cidr = "${var.primary_subnet_cidr}"
  primary_subnet_name = "${var.primary_subnet_name}"
  secondary_subnet_cidr = "${var.secondary_subnet_cidr}"
  secondary_subnet_name = "${var.secondary_subnet_name}"
  allow_cidr_block = "${var.allow_cidr_block}"
  allow_ipv6_cidr_block = "${var.allow_ipv6_cidr_block}"
  ecs_sg_name = "${var.ecs_sg_name}"
}

module "compute" {
  source = "../../../modules/aws/compute"
  autoscaling_group_name = "${var.autoscaling_group_name}"
  launch_configuration_name = "${var.launch_configuration_name}"
  sg = "${module.network.ecs_sg}"
  subnets = [
    "${module.network.primary_subnet_id}",
    "${module.network.secondary_subnet_id}"
  ]
  instance_profile = "${module.iam.instance_profile_name}"
  key_pair = "${var.key_pair}"
  cluster_name = "${var.cluster_name}"
  instance_type = "${var.instance_type}"
  ami = "${var.ami}"
  max_instances = "${var.max_instances}"
  min_instances = "${var.min_instances}"
  desired_capacity = "${var.desired_capacity}"
  vpc = "${module.network.vpc_id}"
}

module "ecs" {
  source = "../../../modules/aws/ecs"
  cluster_name = "${var.cluster_name}"
}




# module "ecs" {
#   source = "./modules/ecs"
#   vpc_id = "${module.network.vpc_id}"
#   main_alb_sg = "${module.network.ecs_sg}"
#   primary_subnet_id = "${module.network.primary_subnet_id}"
#   secondary_subnet_id = "${module.network.secondary_subnet_id}"
#   main_instance_type = "${var.main_instance_type}"
#   default_iam_profile = "${module.iam.ecs_instance_profile_name}"
#   main_ag_max_instances = "${var.main_ag_max_instances}"
#   main_ag_min_instances = "${var.main_ag_min_instances}"
#   main_ag_desired_capacity = "${var.main_ag_desired_capacity}"
# }


# iam vars
#

#
# module "alb" {
#   source = "./modules/alb"
#
#   sg = "${module.vpc.ecsSecurityGroup}"
#   subnet1 = "${module.vpc.ecsPublicSubnet1}"
#   subnet2 = "${module.vpc.ecsPublicSubnet2}"
#   ecsvpc = "${module.vpc.ecsvpc}"
# }
#
# module "api-task-definition" {
#   source = "./modules/ecs/definitions/api"
# }
#
# module "api-service" {
#   source = "./modules/ecs/services/api"
#   ecsServiceRole = "${module.iam.ecsServiceRoleArn}"
#   cluster = "${module.ecs.ecsCluster}"
#   apiTaskDef = "${module.api-task-definition.apiTaskDef}"
#   tg = "${module.alb.ecstg_arn}"
# }
