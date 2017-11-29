variable "main_alb_name" { default = "ecs_alb" }

resource "aws_alb" "main_alb" {
  name = "${var.main_alb_name}"
  security_groups = ["${var.main_alb_sg}"]
  subnets = ["${var.primary_subnet_id}", "${var.secondary_subnet_id}"]
}

output "main_alb_name" { value = "${aws_alb.main_alb.name}" }

output "main_alb_arn" { value = "${aws_alb.main_alb.arn}" }
