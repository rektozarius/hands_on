variable "s3_bucket_name" {
  /* default = "doofyk-test-bucket-1" */
}

variable "ec2-name" {
  default = "doofyk-ec2"
}

variable "ec2-type" {
  default = "t2.micro"
}
variable "ec2-ami" {
  default = "ami-079db87dc4c10ac91"
}