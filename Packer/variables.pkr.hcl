//  variables.pkr.hcl

// CREDENTIALS AWS
variable "aws_access_key" {
  type      = string
  default   = "key"
  sensitive = true
}
variable "aws_secret_key" {
  type      = string
  default   = "key"
  sensitive = true
}

// AMI name
variable "aws_ami" {
  type    = string
  default = "AMI-ALEX"
}

// AWS REGION
variable "aws_region" {
  type      = string
  default   = "us-west-2"
  sensitive = true
}

