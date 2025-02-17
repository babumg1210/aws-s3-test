resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                 = aws_vpc.main_vpc.id
  cidr_block             = var.public_subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_subnet_cidr
  tags = {
    Name = "private_subnet"
  }
}
