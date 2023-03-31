# Terraform Fundamentals
We are going to look at the building blocks of Terraform infrastructure.

Terraform as a tool allows for infrastructure creation across multiple cloud providers. For the purpose of this Lab, we want to use AWS.

Terraform has a 'plugin' style concept that it calls 'providers', in order to create and work with AWS infrastructure in Terraform we must make use of the 'AWS' provider plugin.

There are two key building blocks to understand that apply to all providers; a) Resources and b) Data Sources

Each provider has different names and definitions for the resources and data sources, but the structure of either never changes.

Once we've built our Terraform infrastructure files, we need to plan and deploy it. This is an important concept, so we'll start there first.

# Contents
- [Terraform plan and deploy](#plan-and-deploy)
- [Resource block](#resource-block)
- [Data Sources](#data-sources)
- [Interlinking](#interlinking)
- [Variables](#variables)
- [Terraform State](#terraform-state)

## Plan and deploy
Terraform is a tool which takes 

## Resource block
Whenever you create any service in AWS, like EC2 or RDS, you are creating an infrastructure resource.
In the AWS console you would create resources using web forms, clicking and entering details. In the industry, we call this ClickOps.

An example of ClickOps - Creating an EC2 instance using the AWS console:
![](./images/ec2-creation-page1.png)
![](./images/ec2-creation-page2.png)

All of the options that are available in the console, are also available when creating a Terraform resource.

Think of a Terraform resource as the web form you complete in the AWS console, but in text or 'code'.

An example of an EC2 resource in Terraform.
![](images/ec2-terraform-resource.png)

In the Terraform you will notice similar information being provided as the AWS console screenshots.
ie. Name, Amazon Machine Image (AMI) ID and Instance type.

>The structure of a Terraform resource definition is:
>```'resource' 'resource type' 'custom name'```
>ie. resource "aws_instance" "foo".

Some values for a resource are mandatory, some are optional and may not be needed for the resource you are creating.

For all Terraform resources, you can refer back to the [Terraform documentation](https://registry.terraform.io/namespaces/hashicorp) to find out information on what attributes are required. Given we are using the AWS provider, we would look at the documentation relevant to that - [Terraform AWS Provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs).

This in essence, is all that a Terraform resource is.

## Data Sources

Data sources are another fundamental building block of Terraform infrastructure. They allow us to 'read' data from within our AWS environment.
For instance, if we created the EC2 instance given as an example in the [resource block](#resource-block) section, we could use a data source to read data about that EC2 and make it available for use in our Terraform infrastructure.

On the AWS console, we can take a look at the information available to us for an EC2 by finding that particular instance.
![](./images/ec2-information-page.png)
> The AMI ID is highlighted on purpose.

In Terraform we can define a data source to 'fetch' that data, so we can make use of it within our Terraform files.

Data sources can make use of filters or unique resource IDs to find the data. 
![](./images/ec2-data-source.png)
In this data source, we are wanting to find the information about all EC2 instances that have an AMI ID of `ami-061fbd84f343c52d5`.

>The structure of a Terraform data source definition is:
>```'data' 'data type' 'custom name'```
>ie. data "aws_instance" "burendo_ec2_info"

For the example in use, we are being too broad with our filtering and will encounter an error when we attempt to `terraform apply`.
![](./images/ec2-data-source-error.png)

Data sources must filter to one resource. To fix this issue we can add further filers, to resolve the filtering to a single resource in the data result.

![](./images/ec2-data-source-correct.png)

The information we gain from data sources depends on the resource we took data from.
For the EC2 example we've just shown, we now have the IP and instance ID available to us to use in Terraform.

When we say 'use within Terraform', that links us nicely to [Interlinking](#interlinking).

That's it for data source.

## Interlinking

## Variables

## Terraform State
