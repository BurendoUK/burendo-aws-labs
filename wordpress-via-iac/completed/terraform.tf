# Since we are wanting to deploy this infrastructure on AWS - we require the AWS provider.
# Don't worry Terraform downloads the AWS provider and takes care of that for us when we `terraform init`
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# We've defaulted the variable for the AWS region to the London region here
# However we can overwrite this variable at run-time should we wish
variable "aws_region" {
  default = "eu-west-2"
}

provider "aws" {
  region = var.aws_region
}
