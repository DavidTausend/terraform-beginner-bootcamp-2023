terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length   = 16
  special  = false
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