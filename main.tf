terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

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