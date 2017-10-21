/**
 * Hew represents a component of the Noxian guard responsible of
 * manage the access to certain institutions in th Noxus empire
 * in our case hew is our security group and is responsible
 * of allow or deny the access to our resources
 */
resource "aws_security_group" "hew" {
    name = "noxian-high-command"
    description = "Allow HTTP, HTTPS, and SSH"
    vpc_id = "${aws_vpc.noxus.id}"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "hew" {
  value = "${aws_security_group.hew.id}"
}
