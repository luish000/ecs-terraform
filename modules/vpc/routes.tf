resource "aws_route_table" "zone-noxtoraa" {
  vpc_id = "${aws_vpc.noxus.id}"

  route {
    cidr_block = "10.0.0.0/0"
    gateway_id = "${aws_internet_gateway.noxtoraa.id}"
  }
  
}

resource "aws_route_table_association" "krexor-noxtoraa" {
    subnet_id = "${aws_subnet.krexor.id}"
    route_table_id = "${aws_route_table.zone-noxtoraa.id}"
}

resource "aws_route_table_association" "ironwater-noxtoraa" {
    subnet_id = "${aws_subnet.ironwater.id}"
    route_table_id = "${aws_route_table.zone-noxtoraa.id}"
}
