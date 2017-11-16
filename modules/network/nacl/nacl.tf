variable "allow_cidr_block" {}
variable "vpc_id" {}
variable "primary_subnet_id" {}
variable "secondary_subnet_id" {}

resource "aws_network_acl" "nacl" {

  vpc_id = "${var.vpc_id}"
  subnet_ids = ["${var.primary_subnet_id}", "${var.secondary_subnet_id}"]

  ingress {
      from_port = 0
      to_port = 0
      rule_no = 80
      protocol = "-1"
      action = "allow"
      cidr_block = "${var.allow_cidr_block}"
  }

  egress {
      protocol = "-1"
      rule_no = 100
      action = "allow"
      cidr_block =  "${var.allow_cidr_block}"
      from_port = 0
      to_port = 0
  }

  tags {
    name = "ecs-nacl"
  }

}
