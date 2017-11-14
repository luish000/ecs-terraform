resource "aws_alb" "alb" {
  name = "alb"
  security_groups = ["${var.sg}"]
  subnets = ["${var.subnet1}", "${var.subnet2}"]
}

resource "aws_alb_target_group" "ecstg" {
  name = "tg"
  port = "80"
  protocol = "HTTP"
  vpc_id = "${var.ecsvpc}"

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

resource "aws_alb_listener" "alb-listener" {
  load_balancer_arn = "${aws_alb.alb.arn}"
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.ecstg.arn}"
    type = "forward"
  }
}

output "alb_name" {
  value = "${aws_alb.alb.name}"
}

output "ecstg_arn" {
  value = "${aws_alb_target_group.ecstg.arn}"
}
