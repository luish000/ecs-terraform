variable "vpc_id" {}
variable "main_tg_name" { default = "main" }

resource "aws_alb_target_group" "tg" {
  name = "${var.main_tg_name}"
  port = "80"
  protocol = "HTTP"
  vpc_id = "${var.vpc_id}"

  health_check {
    healthy_threshold = "5"
    unhealthy_threshold = "2"
    interval = "30"
    matcher = "200"
    path = "/"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = "5"
  }

}

output "main_tg_arn" { value = "${aws_alb_target_group.tg.arn}" }
