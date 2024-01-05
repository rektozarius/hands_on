terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "tf-ec2" {
  availability_zone = "us-east-1c"
  ami = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
  key_name = "samuel"
  tags = {
    "Name" = "created by terraform-local"
  }
}

resource "aws_s3_bucket" "tf-s3" {
  bucket = "test-bucket-doofyk-s3"
}