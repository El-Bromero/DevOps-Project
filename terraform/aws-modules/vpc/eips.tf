resource "aws_eip" "nat" {
  count      = length(aws_subnet.public[*].id)

  domain     = "vpc"

  tags = {
        Name = format("%s-eip-nat-%s", var.vpc_name, count.index + 1)
    }
}
