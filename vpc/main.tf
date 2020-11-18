resource "aws_vpc" "main" {
  cidr_block       = var.vpc-cidr-block
  instance_tenancy = "default"
  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "sub" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pub-snA-cidr-block
  map_public_ip_on_launch = true
  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main"
  }
}

resource "aws_route_table_association" "sub-a" {
  depends_on = [
    aws_subnet.sub
  ]
  subnet_id      = aws_subnet.sub.id
  route_table_id = aws_route_table.r.id
}

resource "aws_main_route_table_association" "vpc-a" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.r.id
}