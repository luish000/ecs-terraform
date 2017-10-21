
/**
 * Krexor represents a zone in the noxus empire
 * in our case hew is a subnet
 */
resource "aws_subnet" "krexor" {
  vpc_id = "${aws_vpc.noxus.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags {
    name = "krexor"
  }

}

/**
 * Ironwater represents a zone in the noxus empire
 * in our case hew is a subnet
 */
resource "aws_subnet" "ironwater" {
  vpc_id = "${aws_vpc.noxus.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags {
    name = "ironwater"
  }

}

output "krexor" {
  value = "${aws_subnet.krexor.id}"
}

output "ironwater" {
  value = "${aws_subnet.ironwater.id}"
}
