terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

# -------------------------
# AWS Provider
# -------------------------
provider "aws" {
  region = "us-east-1"
}

# -------------------------
# S3 Bucket 1
# -------------------------
resource "aws_s3_bucket" "bucket_one" {
  bucket = "bluechip-terraform-bucket-1-12345"

  tags = {
    Name        = "bucket-one"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket_one_versioning" {
  bucket = aws_s3_bucket.bucket_one.id

  versioning_configuration {
    status = "Enabled"
  }
}

# -------------------------
# S3 Bucket 2
# -------------------------
resource "aws_s3_bucket" "bucket_two" {
  bucket = "bluechip-terraform-bucket-2-12345"

  tags = {
    Name        = "bucket-two"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket_two_versioning" {
  bucket = aws_s3_bucket.bucket_two.id

  versioning_configuration {
    status = "Enabled"
  }
}
