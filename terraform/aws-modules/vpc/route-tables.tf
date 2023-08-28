# Public Route Table -------------------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }

  tags = {
    Name        = format("%s-public", var.vpc_name)
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public[*].id)

  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

# Private Route Table -------------------------------------
resource "aws_route_table" "private" {
  count  = length(aws_subnet.private[*].id)

  vpc_id = aws_vpc.vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = element(aws_nat_gateway.nat[*].id, count.index)
    }

  tags = {
    Name        = format("%s-private-%s", var.vpc_name, count.index + 1)
  }
}
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private[*].id)

  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = element(aws_route_table.private[*].id, count.index)
}