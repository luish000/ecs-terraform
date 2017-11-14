resource "aws_network_acl" "nacl" {

  vpc_id = "${aws_vpc.ecsvpc.id}"
  subnet_ids = ["${aws_subnet.ecsPublicSubnet1.id}", "${aws_subnet.ecsPublicSubnet2.id}"]

  ingress {
      from_port = 0
      to_port = 0
      rule_no = 80
      protocol = "-1"
      action = "allow"
      cidr_block = "0.0.0.0/0"
  }

  egress {
      protocol = "-1"
      rule_no = 100
      action = "allow"
      cidr_block = "0.0.0.0/0"
      from_port = 0
      to_port = 0
  }

  tags {
    name = "ecs-nacl"
  }

}
