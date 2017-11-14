
resource "aws_subnet" "ecsPublicSubnet1" {
  vpc_id = "${aws_vpc.ecsvpc.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags {
    name = "ecsPublicSubnet1"
  }

}

resource "aws_subnet" "ecsPublicSubnet2" {
  vpc_id = "${aws_vpc.ecsvpc.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags {
    name = "ecsPublicSubnet2"
  }

}

output "ecsPublicSubnet1" {
  value = "${aws_subnet.ecsPublicSubnet1.id}"
}

output "ecsPublicSubnet2" {
  value = "${aws_subnet.ecsPublicSubnet2.id}"
}
