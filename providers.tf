terraform {
  required_version = "1.12.2" # Replace with your installed version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  cloud {

    organization = "terraform-lab-ik-01"

    workspaces {
      name = "t-lab-01"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}