terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
  backend "s3" {
    bucket = "ankitbucketbackend "
    key    = "backend.tfstate"
    region = var.region
  }
}

provider "aws" {
  region = var.region
}
