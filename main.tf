terraform {
  cloud {
    organization = "DavidTausend"

    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "aws" {
  # Configuration options
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {
  lower   = true
  upper   = false
  length  = 32
  special = false
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
  # Bucket Naming Rules
  #https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}

/*
# Create a iam user group
resource "aws_iam_group" "group_admin" {
  name = "Admin"
  path = "/users/"
}

# Create an admin policy for admin user group
resource "aws_iam_group_policy" "admin_policy" {
  name  = "admin_policy"
  group = aws_iam_group.group_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Create a iam user
resource "aws_iam_user" "terraform_user" {
  name = "terraform-beginner-bootcamp"
  path = "/system/"

  tags = {
    tag-key = "terraform-bootcamp"
  }
}
*/