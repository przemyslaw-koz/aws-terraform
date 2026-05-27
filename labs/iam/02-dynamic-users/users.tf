locals {
  common_tags = {
    ManagedBy = "Terraform"
    Project   = "aws-terraform-lab"
  }
}

resource "aws_iam_user" "users" {
  for_each = var.iam_users

  name = each.key

  tags = merge(
    local.common_tags,
    each.value.tags
  )
}

locals {
  user_group_memberships = flatten([
    for username, user_config in var.iam_users : [
      for group_name in user_config.groups : {
        username   = username
        group_name = group_name
      }
    ]
  ])
}

resource "aws_iam_group" "groups" {
  for_each = toset(distinct(flatten([
    for _, user_config in var.iam_users : user_config.groups
  ])))

  name = each.key
}

resource "aws_iam_group_membership" "test_group_membership" {
  for_each = aws_iam_group.groups

  name  = "$(each.key)-membership"
  group = each.key

  users = [
    for membership in local.user_group_memberships :
    membership.username
    if membership.group_name == each.key
  ]

  depends_on = [
    aws_iam_user.users
  ]
}
