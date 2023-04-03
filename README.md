# Burendo AWS Labs

This repo houses self-contained 'Labs' for AWS.
Each lab will contain an instruction set and any supporting material required to complete the activity.

## What is a Lab?

We consider a Lab to be any form of teaching which requires the individual to take action in a self paced, self driven way.

## Service Information
For any services mentioned throughout the labs, you can find additional supporting information in [service-information/README.md](Labs/service-information/README.md).

## Labs Available
- [wordpress-via-console](Labs/wordpress-via-console/README.md) - `Beginner` - A complete guide to create a WordPress website using only the AWS console.
- [wordpress-via-iac](Labs/wordpress-via-iac/README.md) - `Advanced` - An interactive lab to help teach Infrastructure as Code using Terraform.


## Future Labs
See [future labs](FUTURE-LABS.md) for details.

## Issues
Should you come across any issues when using the Labs, please raise an issue using Github.

## Utilities
There exists a 'Labs' Docker container within this repo. The Dockerfile is the source.
This container aims to allow namely Windows users, to have a Linux environment CLI when using tooling, so that instructions can be written with only UNIX in mind.

You do not need to build the image, the container is available on Docker hub. See [Labs Container](labs/LABS-CONTAINER.md) for details.

## Misc
The '.github' folder holds the GitHub actions pipelines. We use these currently to create the [Labs Container](labs/LABS-CONTAINER.md) and push it to Docker Hub.
