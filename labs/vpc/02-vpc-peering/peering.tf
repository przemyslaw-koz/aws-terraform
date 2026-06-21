resource "aws_vpc_peering_connection" "first_vpc_second_vpc" {
  peer_owner_id = var.peer_owner_id
  vpc_id        = aws_vpc.first_vpc.id
  peer_vpc_id   = aws_vpc.second_vpc.id
  auto_accept   = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name      = "${var.stack_name}-vpc-peering"
    Component = "vpc-peering"
  }
}