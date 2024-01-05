terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "num_of_buckets" {
  default = 0
}

variable "s3_bucket_name" {
  default = "doofyk-s3-bucket-1"
}

resource "aws_s3_bucket" "tf-s3" {
  # bucket = "${var.s3_bucket_name}-${count.index}"
  # count = var.num_of_buckets
  # count = var.num_of_buckets != 0 ? var.num_of_buckets : 3
  for_each = toset(var.users)
  bucket   = "example-s3-bucket-${each.value}"
}

resource "aws_iam_user" "new_user" {
  for_each = toset(var.users)
  name = each.value
}

output "uppercase_users" {
  value = [for user in var.users : upper(user) if length(user) > 6]
}