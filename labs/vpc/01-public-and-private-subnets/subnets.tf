resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-north-1a"
  tags = merge(var.common_tags, {
    Name = "${var.stack_name}-public-sn"
  })
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-north-1b"
  tags = merge(var.common_tags, {
    Name = "${var.stack_name}-private-sn"
  })
}