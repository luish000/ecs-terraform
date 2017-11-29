variable "main_alb_sg" {}
variable "primary_subnet_id" {}
variable "secondary_subnet_id" {}
variable "vpc_id" {}

module "load_balancers" {
  source = "./balancers"
  main_alb_sg = "${var.main_alb_sg}"
  primary_subnet_id = "${var.primary_subnet_id}"
  secondary_subnet_id = "${var.secondary_subnet_id}"
}

module "tgs" {
  source = "./target-groups"
  vpc_id = "${var.vpc_id}"
}

module "listeners" {
  source = "./listeners"
  main_tg_arn = "${module.tgs.main_tg_arn}"
  main_alb_arn = "${module.load_balancers.main_alb_arn}"
}
