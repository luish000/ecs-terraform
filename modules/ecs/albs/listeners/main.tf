variable "main_alb_arn" {}

variable "main_tg_arn" {}

resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = "${var.main_alb_arn}"
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = "${var.main_tg_arn}"
    type = "forward"
  }
}
