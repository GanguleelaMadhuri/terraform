resource "aws_vpc" "dev" {
  cidr_block = "10.0.0.0/16"
  tags       = { Name = "development-vpc" }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.0.1.0/24"
  tags       = { Name = "Public-Subnet" }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.0.2.0/24"
  tags       = { Name = "Private-Subnet" }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.dev.id
  tags   = { Name = "dev-igw" }
}

resource "aws_eip" "nat-gw-eip" {
  vpc      = true
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat-gw-eip.id
  subnet_id     = aws_subnet.public.id
  depends_on    = [aws_internet_gateway.gw]
  tags          = { Name = "dev-nat-gw" }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table" "association-rt" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}




