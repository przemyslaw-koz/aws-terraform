module "s3_bucket" {
    source = "../../../modules/s3-private-bucket"
    bucket_name = "lab-s3-daddy-pig-with-beer-static-site-bucket"

    lifecycle_enabled = false
}