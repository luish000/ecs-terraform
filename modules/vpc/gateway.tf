resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.ecsvpc.id}"

  tags {
    name = "Ecs internet gateway"
  }

}
