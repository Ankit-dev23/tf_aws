terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
  backend "s3" {
    bucket = aws_s3_bucket.ankit_bucket.bucket
    key    = "backend.tfstate"
  }
}

provider "aws" {
  region = var.region
}
