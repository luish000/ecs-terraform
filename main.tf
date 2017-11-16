# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "./modules/network"
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

# module "iam" {
#   source = "./modules/iam"
# }
#
# module "vpc" {
#   source = "./modules/vpc"
# }

# module "ecs" {
#   source = "./modules/ecs"
#
#   cluster_name = "${var.cluster_name}"
# }
#
# module "ec2" {
#   source = "./modules/ec2"
#
#   sg = "${module.vpc.ecsSecurityGroup}"
#   subnet1 = "${module.vpc.ecsPublicSubnet1}"
#   subnet2 = "${module.vpc.ecsPublicSubnet2}"
#   instanceProfile = "${module.iam.ecsInstanceProfile}"
#   key_pair = "${var.key_pair}"
#   cluster_name = "${var.cluster_name}"
# }
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
