
resource "aws_security_group" "sg" {
    name = "ecsSecurityGroup"
    description = "Allow HTTP, HTTPS, and SSH"
    vpc_id = "${aws_vpc.ecsvpc.id}"

    ingress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 0
        to_port = 0
        protocol = -1
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "ecsSecurityGroup" {
  value = "${aws_security_group.sg.id}"
}
