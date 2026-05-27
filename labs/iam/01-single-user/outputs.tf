output "test_user_name" {
  value = aws_iam_user.test_user.name
}

output "test_user_arn" {
  value = aws_iam_user.test_user.arn
}

output "test_group_name" {
  value = aws_iam_group.test_group.name
}

output "policy_arn" {
  value = aws_iam_policy.s3_list_only.arn
}