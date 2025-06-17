terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"

  tags = {
    Name = "ankit_tf_first"
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"

  tags = {
    Name = "ankit_tf_first2"
  }
}

resource "aws_instance" "web3" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"

  tags = {
    Name = "ankit_tf_first3"
  }
}