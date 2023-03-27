# Burendo AWS Labs

This repo contains self-contained folders for AWS hands on labs.
Each lab will contain an instruction set and any supporting material.

## Service Information
For any services mentioned throughout the labs, you can find additional supporting information in [service-information/README.md](service-information/README.md).

## Labs Available
- [wordpress-via-console](wordpress-via-console/README.md) - A complete guide to create a WordPress website using only the AWS console.
- [wordpress-via-iac](wordpress-via-iac/README.md) - An interactive lab to help teach Infrastructure as Code using Terraform.

## Issues
Should you come across any issues when using the labs, please raise an issue using Github.

## Utilities
Within this repo there is a Dockerfile that will create a like for like container environment across Windows, Mac and Linux operating systems. This helps to mitigate operating system nuances.
In order to use this container, you will need to have installed Docker on your operating system. Build the image and run it.

Resources to help you on Windows:
- [Setup Linux containers on Windows](https://learn.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-10-linux)

Resources to help you on Mac:
- [Install Docker Desktop on Mac](https://docs.docker.com/desktop/install/mac-install/) 
- [System Information User Guide for Mac](https://support.apple.com/en-gb/guide/system-information/syspr35536/mac) - To help you work out which chipset you are using.

Resources to help you on Linux (assumed Ubuntu):
- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
