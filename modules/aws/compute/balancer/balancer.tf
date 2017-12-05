variable "subnets" { type = "list" }
variable "sg" {}
variable "vpc" {}

module "alb" {
  source = "./alb"
  subnets = ["${var.subnets}"]
  sg = "${var.sg}"
}

module "tg" {
  source = "./tg"
  vpc_id = "${var.vpc}"
}

module "listener" {
  source = "./listener"
  alb = "${module.alb.arn}"
  tg = "${module.tg.arn}"
}
