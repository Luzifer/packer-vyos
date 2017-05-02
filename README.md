# Luzifer / packer-vyos

This repository contains a [Packer](https://www.packer.io/) setup to build an [Amazon Web Services](https://aws.amazon.com/) EC2 AMI from a [VyOS](https://vyos.io/) ISO image.

## How to use this?

If you really trust me not to mess with your router setup (hint: you shouldn't as I'm not part of the VyOS project) and want to create your EC2 in `eu-west-1`you can search for public images with `Owner: 921304813343`. You will find a `Packer-VyOS-x.x.x` image...

If you prefer to create your own image:

- Install the [latest version of Packer](https://www.packer.io/downloads.html)
- Register an AWS account
- Gather an AWS access key with its corresponding secret key
- Get or create a public subnet within your VPC and note down vpc-id and subnet-id
- Look up the version number of the latest [VyOS release](http://packages.vyos.net/iso/release/)
- Adjust the variables inside `packer.json` or expose the variables using environment variables
- Execute `make` to build the AMI

If you want to create the image in another region you need to [find the matching Ubuntu AMI](https://cloud-images.ubuntu.com/locator/ec2/) (search for `16.04 ebs hvm`)

## How this works

The provisioning script used here is a compact version of the [vyos/build-ami](https://github.com/vyos/build-ami) Ansible playbook. The Ubuntu AMI is booted with an extra EBS volume, the files are copied (and slightly modified) to that EBS and after finishing the file collection the EBS is bundled to an AMI.
