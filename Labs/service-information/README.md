# AWS Service Information
This glossary supplies information on AWS services with an alternative definition will help to grasp understanding.

# VPC
*Virtual Private Cloud*

A virtual private cloud is a network on the cloud. 

[View AWS information here](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)

A different explanation: 
```
Imagine a house, with a garden fence which surrounds all four sides. The fence is the VPC.
```

# Subnet
*Subnetting*

A subnet is a network within a CIDR range boundary (view CIDR explanation here), that exists within a wider network (VPC).
Resources within a subnet can talk with each other within the need for a router.
Resources within differing subnets but under the same wider network (VPC) require routing - see Route Table.

[View AWS information here](https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html)

A different explanation:
```
If a VPC is a garden fence, the garden can be further subdivided within the fence bounds. A subnet is a section of a garden; like the sandpit area or swimming pool. Think of resources as people for a moment, within any given area of the garden, people in that area can communicate easily with each other.
People in other areas attempting to communicate may need to ask somebody (the router) to convey the message to the indented individual.
```

# Route Table

A route table is a set of rules that determine where network traffic from your subnet should go.

[View AWS information here](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html#RouteTables)

A different explanation:
```
If you have two subnets and a resource in one wishes to work with a resource in another subnet, it has no understanding of how to get to the other resource in order to communicate. The route table holds the path / route to make that connection possible for communication to happen.
```

# VPC Endpoint
*Virtual Private Cloud Endpoint*

A virtual private cloud endpoint is a network endpoint for managed services within AWS. 

[View AWS information here](https://docs.aws.amazon.com/vpc/latest/privatelink/concepts.html?ref=wellarchitected)

A different explanation:
```
If a VPC is a garden fence, a VPC endpoint is a pipe built into that fence, which goes to your neighbours garden, your neighbour being AWS.
```

# NAT Gateway
*Network Address Translation* Gateway

A NAT Gateway translates local network IP address on private CIDR ranges (eg 10.0.0.1 - further explanation here), to allow connectivity to the internet with an accompanying internet gateway. 

[View AWS information here](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)

```
If you send a letter from your house to a friends house, the postal service (the internet), doesn't know who wrote the letter, but the post man (the NAT gateway) who took the letter from you does.
When the a reply is posted back, the post man knows which resident of your house, to hand the letter to.
```

# Security Group

A security group is a firewall for a particular use case. The filtering operates at OSI layer 3/4 and have allow & deny rules. By default everything is denied. 

[View AWS information here](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)

A different explanation:
```
Imagine a house, with a garden enclosed within a garden fence. With three different areas; a barbeque area, a swimming pool area and a sandpit area.
Security Groups are the rules to who is allowed or denied to each area and under what conditions.
```

# EC2
*Elastic Cloud Compute*

An EC2 is a server - with varying different resource size configurations available.
The servers provided by EC2 are elastic in nature, because creation and termination of them is super quick.

[View AWS information here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)

# RDS
*Relational Database Service*

RDS is an AWS managed service for creating relational databases. It offers main / replica setup as well as automated backups. 

[View AWS information here](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html)


# S3
*Simple storage service*

S3 is an object storage service with fantastic availability, redundancy and pricing. You can think of object storage as an infinitely scalable hard drive for storing files.

When you (an application or other AWS managed service on your behalf) upload a file to S3, you can make it available on the web with a URL like Dropbox.
Or you can completely lock down who can access the files within the S3 bucket using IAM.

[View AWS information here](https://aws.amazon.com/s3/)

# IAM
*Identity and Access Management*

Identity and Access Management is crucial when operating on the cloud. It provides security at many levels.
From users to applications, you want to practice the principle of least privilege. That is, to only grant the access and permissions the user or application really needs.

IAM facilitates this access control through the use of users, roles and policies.

[View AWS information here](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)

A different explanation:
```
IAM is an ID card for your users and resources. If a user with access to only floor 1 attempts to access floor 2, they will be denied. Same applies to resources.
```
