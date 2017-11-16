variable "vpc_cidr" {}
variable "name" {}


resource "aws_vpc" "ecs_vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = "true"

  tags {
    name = "${var.name}"
  }
}

output "vpc_id" { value = "${aws_vpc.ecs_vpc.id}" }

output "vpc_cidr" { value = "${var.vpc_cidr}" }
