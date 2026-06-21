resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = var.public_subnet_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name      = "${var.stack_name}-public-sn"
    Component = "public-sn"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = var.private_subnet_availability_zone

  tags = {
    Name      = "${var.stack_name}-private-sn"
    Component = "private-sn"
  }
}

resource "aws_subnet" "public_2" {
  count = var.second_public_subnet != null ? 1 : 0

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.second_public_subnet.cidr_block
  availability_zone       = var.second_public_subnet.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name      = "${var.stack_name}-public-sn-2"
    Component = "public-sn-2"
  }
}

resource "aws_subnet" "private_2" {
  count = var.second_private_subnet != null ? 1 : 0

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.second_private_subnet.cidr_block
  availability_zone = var.second_private_subnet.availability_zone

  tags = {
    Name      = "${var.stack_name}-private-sn-2"
    Component = "private-sn-2"
  }
}
