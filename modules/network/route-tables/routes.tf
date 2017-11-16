variable "allow_cidr_block" {}
variable "internet_gateway_id" {}
variable "vpc_id" {}
variable "primary_subnet_id" {}
variable "secondary_subnet_id" {}

resource "aws_route_table" "ecs_table_route" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "${var.allow_cidr_block}"
    gateway_id = "${var.internet_gateway_id}"
  }

}

resource "aws_route_table_association" "primary_subnet_association" {
  subnet_id = "${var.primary_subnet_id}"
  route_table_id = "${aws_route_table.ecs_table_route.id}"
}

resource "aws_route_table_association" "secondary_subnet_association" {
  subnet_id = "${var.secondary_subnet_id}"
  route_table_id = "${aws_route_table.ecs_table_route.id}"
}
