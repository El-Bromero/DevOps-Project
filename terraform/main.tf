provider "aws" {
  region   = var.aws_region
  profile  = var.aws_profile
}

terraform {
  backend "s3" {
    bucket = "bromero-projects"
    key    = "bromero/devops-project/terraform.tfstate"
    region = "us-east-1"
  }
}