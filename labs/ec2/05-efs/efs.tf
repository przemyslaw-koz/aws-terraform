resource "aws_efs_file_system" "efs_file_system" {
  creation_token = var.creation_token
  encrypted      = true
  lifecycle_policy {
    transition_to_ia      = var.lifecycle_policy.transition_to_ia
    transition_to_archive = var.lifecycle_policy.transition_to_archive
  }

  tags = merge(var.common_tags,
  { Name = var.name })
}