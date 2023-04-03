# Building the infrastructure for a WordPress website
This Lab is 1 part knowledge & 1 part action. Before attempting to complete the 'action', consider gaining the knowledge. Check out the [Resource and Data]

## Setup
> For this section of the Lab it is advised to have the 'Lab' docker container running. See [LABS-CONTAINER.md](../LABS-CONTAINER.md) for instructions.
We've split this section to reduce the noise in the README. Continue the lab by reading the [wordpress-infra-creation.md](wordpress-infra-creation.md) file.

Terraform uses your current active session with AWS, to plan out or deploy infrastructure. You'll need to be logged into AWS on your terminal in order to deploy.
Our tool of choice and the one available within the 'Labs' container (see [labs container information](../LABS-CONTAINER.md)) is `AWSume`.

If you have your AWS profile configured within the `~/.aws/credentials` and `~/.aws/config` files within the environment you will be deploying from, you can use AWSume.
If you've yet to do that, AWS provide information and instructions on how to do that on the [Configuration and credential file settings](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) page.

You may find the [AWSume usage guide](https://awsu.me/general/usage.html) helpful, however the command you are most likely looking for to get authenticated is:

```awsume my-aws-profile-name```
(Replace `my-aws-profile-name` accordingly)

This command will use the profile credentials within the AWS config files and if you have MFA enabled on your account, will ask for your one time passcode.

## Lights, Camera, ACTION
Within the [attempt](./attempt/) folder you will find a 'broken' Terraform infrastructure set for a WordPress website.
Your task is to take your new found knowledge and understanding of both Infrastructure as Code & Terraform, apply it to the 'broken' files and attempt to complete the infrastructure.

In diagram form, the end result should look something like this:
![MVP Architecture Diagram](images/wordpress-via-iac.drawio.png)

If you are using the Labs container, the command to launch it is:
```
docker run -it -v $PWD:/labs burendouk/aws-labs-cli:latest
```

Once launched, you will be greeted with a bash interface. If you aren't familiar with bash, you can find a [cheat sheet here](https://devhints.io/bash).

> There exists a 'complete' example of the Terraform to create a WordPress website. Try to not peek at this unless absolutely necessary!

## Cleaning up
Once you've come to a point of 'done'; whether that be for the day or the attempt. Don't forget to clean up all of the resources you've created on AWS so not to incur any unnecessary charges.

The beauty of Infrastructure as Code as it can clean up for you quickly but should you ever wish to deploy the resources again in the future - it'll take no time at all!

Terraform has a command to remove all resources for a Terraform project.
```terraform destroy```

Read more about [terraform destroy](https://developer.hashicorp.com/terraform/cli/commands/destroy) on the official documentation.

## Going further
The broken Terraform leaves room for improvement. If you've successfully accomplished the above, explore and try to resolve the below, that would make this infrastructure 'Production' ready.

Areas of known limitations:
- No DNS records in Route 53 for a domain name.
- No HTTPS termination on the load balancer.
- No RDS administrative username and password automatic rotation.
- No RDS user created specifically for WordPress access - it uses the admin user.
- The database is initialised by the EC2 - this wouldn't normally be the case. The database schema would be setup external to normally operating web servers.
- No automatic backup of the RDS.
- The NGINX configuration of the web servers is not hardened.
- The PHP configuration of the web servers is not hardened.
- WordPress plugins or themes across multiple servers will not work. Their content would need to be pulled into place onto each new web server that starts up.

Areas for further improvement:
- CloudFront CDN
- Network ACLs
- Using S3 to host the media files - this would allow a multi web server approach for redundancy and scalability.
- Using an EFS to share server specific files (*feasible but not advised) - this would allow plugins and themes to be installed on any server behind the load balancer and all others would also have the files.
- Alternatively to using EFS: Use the userdata script to pull the theme & any plugin scripts into position on launch. Only the CMS that WordPress offers should be used. You would add / test and mark for deployment any plugins you need, in another environment.
