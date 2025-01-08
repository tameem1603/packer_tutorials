packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_name" {
  description = "Name of the AMI"
  type        = string
  default     = "ubuntu-docker-golden-image"
}

variable "ubuntu_ami_id" {
  description = "Ubuntu AMI ID to use as the base image"
  type        = string
  default     = "ami-053b12d3152c0cc71" # Replace with a valid Ubuntu AMI ID
}

source "amazon-ebs" "ubuntu" {
  region          = var.aws_region
  instance_type   = var.instance_type
  source_ami      = var.ubuntu_ami_id
  ssh_username    = "ubuntu"
  ami_name        = var.ami_name
  ami_description = "Golden Image with Docker, AWS CloudAgent, and Git"
  tags = {
    Name        = "Golden Image"
    Environment = "Production"
  }
}

build {
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "file" {
  source = "provisioner.sh"
  destination = "/tmp/provisioner.sh"
}

  provisioner "shell" {
    inline = ["chmod a+x /tmp/provisioner.sh"]
  }
  
  provisioner "shell" {
    inline = [ "ls -la /tmp"]
  }
  
    provisioner "shell" {
    inline = [ "pwd"]
  }
  
  provisioner "shell" {
    inline = [ "cat /tmp/provisioner.sh"]
  }

  provisioner "shell" {
    inline = ["/bin/bash -x /tmp/provisioner.sh"]
  }
}
