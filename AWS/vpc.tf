provider "aws" {
  region = "us-east-2"  
}

resource "aws_vpc" "ionginx_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "ionginx-vpc"
  }
}

resource "aws_subnet" "public" {
  count             = 3
  vpc_id            = aws_vpc.ionginx_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.ionginx_vpc.cidr_block, 8, count.index)
  map_public_ip_on_launch = true
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count             = 3
  vpc_id            = aws_vpc.ionginx_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.ionginx_vpc.cidr_block, 8, count.index + 3)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "private-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ionginx_vpc.id
  tags = {
    Name = "ionginx-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ionginx_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  count          = 3
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat" {
  vpc      = true
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id  # Use one of the public subnets
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.ionginx_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private" {
  count          = 3
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
