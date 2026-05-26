data "aws_iam_policy_document" "s3_list_only" {
  statement {
    sid    = "AllowListAllBuckets"
    effect = "Allow"

    actions = [
      "s3:ListAllMyBuckets",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "s3_list_only" {
  name        = "terraform-s3-list-only"
  description = "Allows listing S3 buckets. Created for TF test."
  policy      = data.aws_iam_policy_document.s3_list_only.json

  tags = {
    ManagedBy = "Terraform",
    Owner     = "PrzemyslawKozlowski"
  }
}

resource "aws_iam_group_policy_attachment" "test_group_s3_list_only" {
  group      = aws_iam_group.test_group.name
  policy_arn = aws_iam_policy.s3_list_only.arn
}