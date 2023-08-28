provider "aws" {
  region   = var.aws_region
  #profile  = var.aws_profile
}

terraform {
  backend "s3" {
    bucket = "bromero-projects"
    key    = "bromero/devops-project/terraform.tfstate"
    region = "us-east-1"
  }
}

module "vpc" {
    source = "./aws-modules/vpc"

    vpc_name = "bromero-EKS-proj"
    vpc_cidr = "10.0.0.0/16"

    public_cidrs = [
        "10.0.1.0/24",
        "10.0.2.0/24"
    ]

    private_cidrs = [
        "10.0.3.0/24",
        "10.0.4.0/24"
    ]

    availability_zones = [
        "us-east-1a",
        "us-east-1b"
    ]

}