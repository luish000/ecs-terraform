resource "aws_route_table" "ecsTableRoute" {
  vpc_id = "${aws_vpc.ecsvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }

}

resource "aws_route_table_association" "subnet1-ecsTableRoute" {
    subnet_id = "${aws_subnet.ecsPublicSubnet1.id}"
    route_table_id = "${aws_route_table.ecsTableRoute.id}"
}

resource "aws_route_table_association" "subnet2-ecsTableRoute" {
    subnet_id = "${aws_subnet.ecsPublicSubnet2.id}"
    route_table_id = "${aws_route_table.ecsTableRoute.id}"
}
