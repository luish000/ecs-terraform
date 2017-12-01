variable "name" { default = "alb" }
variable "subnets" { type = "list" }
variable "sg" {}

resource "aws_alb" "alb" {
  name = "${var.name}"
  security_groups = ["${var.sg}"]
  subnets = var.subnets
}

output "name" { value = "${aws_alb.alb.name}" }

output "arn" { value = "${aws_alb.alb.arn}" }
