variable "primary_subnet_cidr" {}
variable "primary_subnet_name" {}
variable "vpc_id" {}

resource "aws_subnet" "primary_subnet" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.primary_subnet_cidr}"
  availability_zone = "us-east-1a"

  tags {
    name = "${var.primary_subnet_name}"
  }

}

output "primary_subnet_id" { value = "${aws_subnet.primary_subnet.id}" }
