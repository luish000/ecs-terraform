variable "ecs_sg_name" {}
variable "allow_cidr_block" {}
variable "allow_ipv6_cidr_block" {}
variable "vpc_id" {}

resource "aws_security_group" "sg" {
    name = "${var.ecs_sg_name}"
    description = "Allow HTTP, HTTPS, and SSH"
    vpc_id = "${var.vpc_id}"

    ingress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["${var.allow_cidr_block}"]
    }

    ingress {
        from_port = 0
        to_port = 0
        protocol = -1
        ipv6_cidr_blocks = ["${var.allow_ipv6_cidr_block}"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["${var.allow_cidr_block}"]
    }
}

output "sg_id" { value = "${aws_security_group.sg.id}" }
