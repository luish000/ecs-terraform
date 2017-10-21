
/**
 * Cleave represents a component of the Noxian guard responsible of
 * manage the access to certain zones in th Noxus empirw in our
 * case cleave is our NACL and is responsible of allow or deny
 * the access to our availability zones
 */
resource "aws_network_acl" "cleave" {

  vpc_id = "${aws_vpc.noxus.id}"
  subnet_ids = ["${aws_subnet.krexor.id}", "${aws_subnet.ironwater.id}"]

  ingress {
      from_port = 80
      to_port = 80
      rule_no = 100
      protocol = "tcp"
      action = "allow"
      cidr_block = "0.0.0.0/0"
  }

  ingress {
      from_port = 443
      to_port = 443
      rule_no = 200
      protocol = "tcp"
      action = "allow"
      cidr_block = "0.0.0.0/0"
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      rule_no = 300
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
    name = "cleave"
  }

}
