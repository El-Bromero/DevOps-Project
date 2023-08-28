# VPC Variables ---------------------------------------
variable "vpc_cidr" {
    description = "..."
}

variable "vpc_name" {
    description = "..."
}

# Subnet Variables ------------------------------------
variable "public_cidrs" {
    type        = list
    description = "..."
}
variable "private_cidrs" {
    type        = list
    description = "..."
}


variable "availability_zones" {
    type        = list
    description = "..."
}