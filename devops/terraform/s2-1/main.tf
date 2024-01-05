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

locals {
  mytag = "doofyk-local-name"
}

resource "aws_instance" "tf-ec2" {
  ami           = var.ec2-ami
  instance_type = var.ec2-type
  key_name      = "samuel"
  tags = {
    Name = "${local.mytag}-fromlocal"
  }
}

resource "aws_s3_bucket" "tf-s3" {
  bucket = var.s3_bucket_name
  tags = {
    Name = "${local.mytag}-fromlocal"
  }
}

output "tf-example-public-ip" {
  value = aws_instance.tf-ec2.public_ip
}

output "tf-example-s3-meta" {
  value = aws_s3_bucket.tf-s3.region
}


