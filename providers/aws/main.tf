terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "instance1" {
  ami           = var.selected_ami
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
