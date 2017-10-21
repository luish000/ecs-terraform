/**
 * Noxtoraa is the connection between noxus and rest of the world
 * in our case is the an internet gateway
 */
resource "aws_internet_gateway" "noxtoraa" {
  vpc_id = "${aws_vpc.noxus.id}"

  tags {
    name = "noxtoraa"
  }

}
