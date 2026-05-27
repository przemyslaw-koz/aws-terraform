resource "aws_iam_role" "ec2_demo_role" {
  name = "ec2-demo-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Owner     = "PrzemyslawKozlowski"
    ManagedBy = "Terraform"
  }
}

data "aws_iam_policy_document" "ec2_s3_read_only" {
  statement {
    effect = "Allow"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "ec2_s3_read_only" {
  name        = "ec2-demo-s3-read-only"
  description = "Read-only S3 access for EC2."
  policy      = data.aws_iam_policy_document.ec2_s3_read_only.json
}

resource "aws_iam_role_policy_attachment" "ec2_demo_s3_readonly" {
  role       = aws_iam_role.ec2_demo_role.name
  policy_arn = aws_iam_policy.ec2_s3_read_only.arn
}

resource "aws_iam_instance_profile" "ec2_demo_profile" {
  name = "ec2-demo-profile"
  role = aws_iam_role.ec2_demo_role.name
}