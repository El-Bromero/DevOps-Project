# Public Subnets ----------------------------------
resource "aws_subnet" "public" {
    count             = length(var.public_cidrs)

    vpc_id            = aws_vpc.vpc.id
    cidr_block        = var.public_cidrs[count.index]
    availability_zone = element(var.availability_zones, count.index)

    tags = {
        Name          = format("%s-%s-public", var.vpc_name, element(var.availability_zones, count.index))
    }
}

# Private Subnets ----------------------------------
resource "aws_subnet" "private" {
    count             = length(var.private_cidrs)

    vpc_id            = aws_vpc.vpc.id
    cidr_block        = var.private_cidrs[count.index]
    availability_zone = element(var.availability_zones, count.index)

    tags = {
        Name          = format("%s-%s-private", var.vpc_name, element(var.availability_zones, count.index))
    }
}