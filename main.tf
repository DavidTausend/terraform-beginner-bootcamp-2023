# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "website_bucket" {
  # Bucket Naming Rules
  #https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }
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