variable "vpc_id" {}
variable "name" { default = "main" }
variable "port" { default = "80" }
variable "protocol" { default = "HTTP" }

resource "aws_alb_target_group" "tg" {
  name = "${var.name}"
  port = "${var.port}"
  protocol = "${var.protocol}"
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

output "arn" { value = "${aws_alb_target_group.tg.arn}" }
