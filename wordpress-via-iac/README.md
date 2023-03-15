# WordPress via Infrastructure as Code

We can create 'infrastructure', servers and other related resources; through the AWS console by using the setup wizard forms. This is problematic for numerous reasons and therefore not ideal when building products for the long term:

- Not easily repeatable
- Prone to human error
- Time-consuming

Infrastructure as Code is the practice of creating infrastructure via code like configuration files. Numerous tools exist in this area, each solving something different. For this lab, we will focus on one of the more popular tools: Terraform.

The benefits of the infrastructure of code far outweighs the cost of creating it in the first place:

- Repeatable, automated creation of infrastructure - allowing you to create an exact copy in another environment should you wish to.
- Easy for multiple users to work on at once
- Can (should) be committed to a Git repo - allowing for version control & reviews
- Some protections in place (can't destroy resources that are depended upon)

## Prerequisites

- An AWS account
- [AWSume](https://awsu.me/) installed
- A machine running Windows, macOS or Linux
- Terraform (see below)

## Terraform

Terraform is an open-source Infrastructure as Code product released by Hashicorp.
It uses a declarative syntax language called Hashicorp Configuration Language (HCL) to declare the infrastructure you'd like to create in configuration files, known as Terraform files.

### Installation
Head to the official Hashicorp website for Terraform to install Terraform appropriate to your operating system.
[developer.hashicorp.com](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)

> Note: Windows users will need to download the 'AMD64' version.

> Note: Mac and Linux users, you may find '[tf-env](https://github.com/tfutils/tfenv)' (terraform-environment) tool useful. It is not essential, but allows you to control your Terraform environment version better. 

### Documentation

Hashicorp Configuration Language is something that is in essence easy to pick up, but the 'resource' blocks are not something you'll ever need to memorise as they are all available to find on the official [Terraform Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs).

# The Lab

For this lab we are going to work in three parts:

- Introduction to resource and data blocks
- Create a VPC, EC2 and RDS database for a WordPress installation
- Deploy the Infrastructure and see the newly formed WordPress website

> There exists a 'complete' example of the Terraform to create a WordPress website. Try to not peek at this unless absolutely necessary! 

## Resource and Data blocks

Read more about resource and data blocks in the [resource-data-blocks.md](resource-data-blocks.md) file.

## Create the WordPress infrastructure

Read more about the resources required to create a WordPress in the [wordpress-infra-creation.md](wordpress-infra-creation.md) file.

# Quick Reference
    terraform apply     - Applies the terraform configuration against your environment (destructive)
    terraform plan      - Plans the terraform configuration against your environment
    terraform init      - Initialise the project and downloads required plugins
    terraform fmt       - Formats the Terraform code to be presentable
    terraform destroy   - Destroys all the infrastructure specified in the Terraform files, or a particular resource specified (destructive)

For more information on each of the commands, refer to the [Terraform Command Documentation](https://developer.hashicorp.com/terraform/cli/commands)

Destructive labels have been given to the above commands. These commands are destructive in that they will destroy infrastructure if you are not careful.

# Limitations
This lab has reduced the complexity of the Terraform setup slightly, by not using a remote state lock; instead, we will use the local lock file.
In a team setup, you would use a remote state lock (in AWS' case, S3 & DynamoDB) to ensure only a single Terraform deployment can happen to an environment at once and that changes to the environment are saved, so that correct traceability of the changes are required and can be presented to others also using Terraform.

# CONNOR - INSTRUCTION SETS REQUIRED
- AWSUME instructions for profile login

