resource "aws_iam_user" "test_user" {
  name = "terraform-test-user"

  tags = {
    ManagedBy = "Terraform"
    Owner     = "PrzemyslawKozlowski"
  }
}

resource "aws_iam_group" "test_group" {
  name = "tf-test-group"
}

resource "aws_iam_group_membership" "test_group_membership" {
  name = "terraform-test-group-membership"

  users = [
    aws_iam_user.test_user.name
  ]

  group = aws_iam_group.test_group.name
}