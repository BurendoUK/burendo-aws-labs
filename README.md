# Burendo AWS Labs

This repo houses self-contained 'Labs' for AWS.
Each lab will contain an instruction set and any supporting material required to complete the activity.

## What is a Lab?

We consider a Lab to be any form of teaching which requires the individual to take action in a self paced, self driven way.

## Service Information
For any services mentioned throughout the labs, you can find additional supporting information in [service-information/README.md](service-information/README.md).

## Labs Available
- [wordpress-via-console](wordpress-via-console/README.md) - `Beginner` - A complete guide to create a WordPress website using only the AWS console.
- [wordpress-via-iac](wordpress-via-iac/README.md) - `Advanced` - An interactive lab to help teach Infrastructure as Code using Terraform.


## Future Labs
See [future labs](FUTURE-LABS.md) for details.

## Issues
Should you come across any issues when using the Labs, please raise an issue using Github.

## Utilities
There exists a 'Labs' Docker container within this repo. The Dockerfile is the source.
This container aims to allow namely Windows users, to have a Linux environment CLI when using tooling, so that instructions can be written with only UNIX in mind.

You do not need to build the image, the container is available on Docker hub. See [Labs Container](labs/LABS-CONTAINER.md) for details.

## Misc
The '.github' folder offers no value related to any labs. It is a supporting element to present these labs on the [Burendo Handbook](https://handbook.burendo.com/)

## Contributors

For contributors, the GitHub actions pipeline 'merge.yaml' will run on merge to the main branch - this will trigger the [merge pipeline](https://github.com/BurendoUK/burendo-handbook-infrastructure/blob/main/.github/workflows/tf-merge.yml) in [BurendoUK/burendo-handbook-infrastructure](https://github.com/BurendoUK/burendo-handbook-infrastructure) repo.
This is to ensure that the latest labs content is reflected on the handbook website without manual intervention required to rebuild & deploy.
