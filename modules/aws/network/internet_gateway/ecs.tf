variable "vpc_id" {}

resource "aws_internet_gateway" "ig" {
  vpc_id = "${var.vpc_id}"

  tags {
    name = "Ecs internet gateway"
  }

}

output "id" { value = "${aws_internet_gateway.ig.id}" }
