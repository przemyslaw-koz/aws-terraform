resource "aws_vpc_endpoint" "s3" {
  vpc_id            = module.networking.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [module.networking.private_route_table_id]

  tags = {
    Name      = "${var.stack_name}-s3-endpoint"
    Component = "s3-endpoint"
  }
}
