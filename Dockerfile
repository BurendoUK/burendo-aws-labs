# To circumvent M1 chipset not being natively supported by all packages, define the platform
# Rosetta 2 will handle the rest
FROM --platform=linux/amd64 ubuntu:22.04

RUN apt update -y

# Install essential packages
RUN apt install sudo git lsb-release wget curl unzip vim nano gpg -y

# Install Terraform
RUN wget --quiet https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_linux_amd64.zip \
    && unzip terraform_1.4.2_linux_amd64.zip \
    && mv terraform /usr/bin \
    && rm terraform_1.4.2_linux_amd64.zip

# Install AWS CLI v2
RUN apt install groff less -y
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm -rf ./aws

# Install AWSUME
RUN apt install pip -y
RUN pip install awsume

ENTRYPOINT [ "/bin/bash" ]
