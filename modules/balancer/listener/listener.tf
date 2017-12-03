variable "alb" {}
variable "tg" {}
variable "port" { default = "80" }
variable "action" { default = "forward" }
variable "protocol" { default = "HTTP" }

resource "aws_alb_listener" "listener" {
  load_balancer_arn = "${var.alb}"
  port = "${var.port}"
  protocol = "${var.protocol}"

  default_action {
    target_group_arn = "${var.tg}"
    type = "${var.action}"
  }
}
