terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
  backend "s3" {
    bucket = "ankit-bucket-nrzb1234"
    key    = "backend.tfstate"
  }
}

provider "aws" {
  region = var.region
}
