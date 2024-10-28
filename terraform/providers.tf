provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn     = "arn:aws:iam::371027173325:role/GithubActionsCrossAccountRole"
    session_name = "testing_terraform_infra"
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.2.0"
    }
  }

  required_version = ">= 0.15.5"
}