resource "aws_subnet" "first_vpc" {
  vpc_id            = aws_vpc.first_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-north-1a"
  tags = {
    Name      = "${var.stack_name}-first-sn"
    Component = "first-vpc-sn"
  }
}

resource "aws_subnet" "second_vpc" {
  vpc_id            = aws_vpc.second_vpc.id
  cidr_block        = "10.1.0.0/24"
  availability_zone = "eu-north-1b"
  tags = {
    Name      = "${var.stack_name}-second-sn"
    Component = "second-vpc-sn"
  }
}