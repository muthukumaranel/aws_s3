module "s3" {
  source         = "./s3"
  s3_bucket_name = "tf-test-bucket"
}