# The Lab Container

The container has been created to allow for a unified environment across all potential operating systems people may be using while working through these labs.
It is not required for all labs - where it is required, it will be called out.

The container, is a Docker container - find out more on the Docker website [Overview - Docker](https://docs.docker.com/get-started/).

> You do not need to use the container if you are comfortable setting up the required tools on your main operating system.

## Prerequisites

- Docker installed - [Download Docker here](https://www.docker.com/products/docker-desktop/)

## Running the container

The Dockerfile which builds the container is housed at the root level of the [burendo-aws-labs](https://github.com/BurendoUK/burendo-aws-labs) repo.
However, the container is built and pushed to Docker Hub for your convenience so that you do not have to build it locally before using.

To pull, run and interact with the container, use the following command inside the folder of the specific Lab you are working on.
```
docker run -it -v $PWD:/labs --platform=linux/amd64 burendouk/aws-labs-cli:latest
```

If you find you've exited the container - just re-run the command again.

> Note: Platform is specified to ensure compatibility across Mac devices.
> If you receive a `not found: manifest unknown` remove the `--platform` flag and value.

Resources to help you on Windows:
- [Setup Linux containers on Windows](https://learn.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-10-linux)

Resources to help you on Mac:
- [Install Docker Desktop on Mac](https://docs.docker.com/desktop/install/mac-install/) 
- [System Information User Guide for Mac](https://support.apple.com/en-gb/guide/system-information/syspr35536/mac) - To help you work out which chipset you are using.

Resources to help you on Linux (assumed Ubuntu):
- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

## Navigating your operating system terminal
For Linux and Mac users, you can navigate your operating system terminal using
`cd`.


