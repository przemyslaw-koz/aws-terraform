resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.availability_zone
  size              = var.size
  type              = var.volume_type
  encrypted         = true
  tags = merge(var.common_tags,
  { Name = "ebs-volume" })
}