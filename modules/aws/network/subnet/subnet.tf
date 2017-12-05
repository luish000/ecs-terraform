variable "subnet_cidr" {}
variable "subnet_name" {}
variable "vpc_id" {}
variable "availability_zone" {}

resource "aws_subnet" "subnet" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"
  availability_zone = "${var.availability_zone}"

  tags {
    name = "${var.subnet_name}"
  }

}

output "id" { value = "${aws_subnet.subnet.id}" }
