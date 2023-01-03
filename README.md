# Burendo AWS Labs

This repo contains self-contained folders for AWS hands on labs.
Each lab will contain an instruction set and any supporting material.

## Service Information
For any services mentioned throughout the labs, you can find additional supporting information in [service-information/README.md](service-information/README.md).

## Labs Available

[wordpress-via-console](wordpress-via-console/README.md) - A complete guide to create a WordPress website using only the AWS console.

## Issues
Should you come across any issues when using the labs, please raise an issue using Github.


## Misc
The '.github' folder offers no value related to any labs. It is a supporting element to present these labs on the [Burendo Handbook](https://handbook.burendo.com/)

## Contributors

For contributors, the GitHub actions pipeline 'merge.yaml' will run on merge to the main branch - this will trigger the [merge pipeline](https://github.com/BurendoUK/burendo-handbook-infrastructure/blob/main/.github/workflows/tf-merge.yml) in [BurendoUK/burendo-handbook-infrastructure](https://github.com/BurendoUK/burendo-handbook-infrastructure) repo.
This is to ensure that the latest labs content is reflected on the handbook website without manual intervention required to rebuild & deploy.
