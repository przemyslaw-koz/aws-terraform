resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = var.public_subnet_availability_zone
  map_public_ip_on_launch = true
  tags = merge(var.common_tags, {
    Name = "${var.stack_name}-public-sn"
  })
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = var.private_subnet_availability_zone
  tags = merge(var.common_tags, {
    Name = "${var.stack_name}-private-sn"
  })
}