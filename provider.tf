terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.35.0"
    }
  }
}

provider "aws" {
  region     = "eu-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
  
  assume_role {
    # The role ARN within Account B to AssumeRole into.
    role_arn = "arn:aws:iam::161331958293:role/OrganizationAccountAccessRole"
  }
}
