# The Lab Container

The container has been created to allow for a unified environment across all potential operating systems people may be using while working through these labs.
It is not required for all labs - where it is required, it will be called out.

The container, is a Docker container - find out more on the Docker website [Overview - Docker](https://docs.docker.com/get-started/).

> You do not need to use the container if you are comfortable setting up the required tools on your main operating system.

## Prerequisites

- Docker installed

## Running the container

The Dockerfile which builds the container is housed at the root level of the [burendo-aws-labs](https://github.com/BurendoUK/burendo-aws-labs) repo.
However, the container is built and pushed to Docker Hub for your convenience so that you do not have to build it locally before using.

To pull, run and interact with the container, use the following command inside the folder of the specific Lab you are working on.
```
docker run -it -v $PWD:/labs burendouk/aws-labs-cli:latest
```

If you find you've exited the container - just re-run the command again.

## Navigating your operating system terminal
For Linux and Mac users, you can navigate your operating system terminal
