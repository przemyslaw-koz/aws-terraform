resource "aws_s3_bucket" "private_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "private_bucket_public_access_block" {
  bucket = aws_s3_bucket.private_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "private_bucket_versioning" {
  bucket = aws_s3_bucket.private_bucket.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "private_bucket_sse_config" {
  bucket = aws_s3_bucket.private_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "private_bucket_ownership_controls" {
  bucket = aws_s3_bucket.private_bucket.id

  depends_on = [aws_s3_bucket_public_access_block.private_bucket_public_access_block]

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "private_bucket_lifecycle_config" {
  bucket = aws_s3_bucket.private_bucket.id

  depends_on = [aws_s3_bucket_versioning.private_bucket_versioning]

  rule {
    id     = "archive-old-objects"
    status = var.lifecycle_enabled ? "Enabled" : "Disabled"
    filter {}
    transition {
      days          = var.transition_days
      storage_class = "STANDARD_IA"
    }
    expiration {
      days = var.expiration_days
    }
    noncurrent_version_expiration {
      noncurrent_days = var.noncurrent_version_expiration_days
    }
  }
}

resource "aws_s3_bucket_policy" "deny_no_tls_access" {
  bucket = aws_s3_bucket.private_bucket.id
  policy = data.aws_iam_policy_document.deny_no_tls_access.json
}

data "aws_iam_policy_document" "deny_no_tls_access" {
  statement {
    effect = "Deny"
    sid    = "DenyNoTLSAccess"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:*",
    ]

    resources = [
      aws_s3_bucket.private_bucket.arn,
      "${aws_s3_bucket.private_bucket.arn}/*",
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}