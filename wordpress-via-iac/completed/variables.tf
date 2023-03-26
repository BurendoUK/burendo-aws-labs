# We've defaulted the variable for the AWS region to the London region here
# However we can overwrite this variable at run-time should we wish
variable "aws_region" {
  default = "eu-west-2"
}

variable "ec2_instance_class" {
    default = "t3.micro"
}
