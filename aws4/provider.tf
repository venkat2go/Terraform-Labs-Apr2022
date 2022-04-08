terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.8.0"
    }
  }
  backend "s3" {
    bucket = "venkatterraformapr2022"
    region = "us-east-2"
    key = "backend-venkat/terraform.tfstate"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-2"
}