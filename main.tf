# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "iam" {
  source = "./modules/iam"
}

module "vpc" {
  source = "./modules/vpc"
}

module "alb" {
  source = "./modules/alb"

  hew = "${module.vpc.hew}"
  krexor = "${module.vpc.krexor}"
  ironwater = "${module.vpc.ironwater}"
  noxus = "${module.vpc.noxus}"
}

module "ecs" {
  source = "./modules/ecs"

  cluster_name = "${var.cluster_name}"
}

module "ec2" {
  source = "./modules/ec2"

  hew = "${module.vpc.hew}"
  krexor = "${module.vpc.krexor}"
  ironwater = "${module.vpc.ironwater}"
  noxian_instance_profile = "${module.iam.noxian_instance_profile}"
  key_pair = "${var.key_pair}"
  cluster_name = "${var.cluster_name}"
}
