resource "aws_alb" "noxian_alb" {
  name = "alb"
  security_groups = ["${var.hew}"]
  subnets = ["${var.krexor}", "${var.ironwater}"]
}

resource "aws_alb_target_group" "noxiantg" {
  name = "noxiantg"
  port = "80"
  protocol = "HTTP"
  vpc_id = "${var.noxus}"

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
  load_balancer_arn = "${aws_alb.noxian_alb.arn}"
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.noxiantg.arn}"
    type = "forward"
  }
}

output "noxian_alb_name" {
  value = "${aws_alb.noxian_alb.name}"
}

output "noxiantg_arn" {
  value = "${aws_alb_target_group.noxiantg.arn}"
}
