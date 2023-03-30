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

provider "aws" {
  region = var.aws_region
}
