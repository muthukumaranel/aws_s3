provider "aws" {
    region = "us-west-2"
}

resource "random_id" "my_random_id" {
    byte_length = 2
}

resource "aws_s3_bucket" "muthu-test-bucket" {
    bucket = "${var.s3_bucket_name}-${random_id.my_random_id.dec}"
    acl = "private"
    versioning {
        enabled = true
    }
    
    lifecycle_rule {
        enabled = true
    
    
    transition {
        storage_class = "STANDARD_IA"
        days = 30
    }
 }

    tags = {
        Name = "Muthu-tf-bucket"
   }
 
}