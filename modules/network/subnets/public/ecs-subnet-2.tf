variable "secondary_subnet_cidr" {}
variable "secondary_subnet_name" {}

resource "aws_subnet" "secondary_subnet" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.secondary_subnet_cidr}"
  availability_zone = "us-east-1b"

  tags {
    name = "${var.secondary_subnet_name}"
  }

}

output "secondary_subnet_id" { value = "${aws_subnet.secondary_subnet.id}" }
