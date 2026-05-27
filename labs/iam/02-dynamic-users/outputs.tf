output "user_names" {
  description = "Names of IAM users created by tf"
  value = [
    for user in aws_iam_user.users :
    user.name
  ]
}

output "user_arns" {
  description = "ARNs of IAM users created by tf"
  value = {
    for username, user in aws_iam_user.users :
    username => user.arn
  }
}

output "group_names" {
  description = "Names of IAM groups created by tf"
  value = [
    for group in aws_iam_group.groups :
    group.name
  ]
}

output "group_memberships" {
  description = "IAM group memberships"
  value = {
    for group_name, users in aws_iam_group_membership.test_group_membership :
    group_name => users.users
  }
}