# WordPress via Infrastructure as Code

We can create 'infrastructure', servers and other related resources; through the AWS console by using the setup wizard forms. This is problematic for numerous reasons and therefore not ideal when building products for the long term:

- Not easily repeatable
- Prone to human error
- Time-consuming

Infrastructure as Code is the practice of creating infrastructure via code like configuration files. Numerous tools exist in this area, each solving something different. For this lab, we will focus on one of the more popular tools: Terraform.

The benefits of the infrastructure of code far outweigh the cost of creating it in the first place:

- Repeatable, automated creation of infrastructure - allowing you to create an exact copy in another environment should you wish to
- Easy for multiple users to work on at once
- Can (should) be committed to a Git repo - allowing for version control & reviews
- Some protections in place (can't destroy resources that are depended upon)

## Prerequisites

- An AWS account - With access and secret keys created
- A machine running Windows, macOS or Linux
- An IDE - We suggest [VS Code](https://code.visualstudio.com/download) and the 'Hashicorp Terraform' extension by Hashicorp.
- Docker installed* - [Download Docker](https://docs.docker.com/get-docker/)
- Terraform* - [Download Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)
- [AWSume](https://awsu.me/)*

Items marked with an * are not required to be installed on your operating system if you are comfortable using the tooling running natively on your operating system.

If you are unsure how to install the tooling, we suggest using the Labs container, which completes the installation for you and you can read more about that in the [Labs container instructions](../LABS-CONTAINER.md).

# The Lab
Efforts have been made to ensure the product of this Lab only uses free-tier services. Unfortunately, we aren't able to guarantee this. Consider setting a budget & remember to remove all unused resources to avoid further costs.

For this lab we are going to work in three parts:

- Introduction to Terraform fundamentals - Read more in the [Terraform fundamentals file](terraform-fundamentals.md).
- Create a VPC, EC2 and RDS database for a WordPress installation - Read more in the [WordPress Lab file](wordpress-lab.md).
- Deploy the Infrastructure and see the newly formed WordPress website!

## Deploy

Use the quick reference commands to plan or apply your infrastructure creation as you go - or only once you've finished.
Terraform will highlight any issues it finds.

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

