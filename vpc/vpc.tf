# VPC
resource "aws_vpc" "three-tier-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "three-tier-vpc"
  }
}

# Public Subnets 
resource "aws_subnet" "three-tier-pub-sub-1" {
  vpc_id            = aws_vpc.three-tier-vpc.id
  cidr_block        = var.pub_sub1
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "three-tier-pub-sub-1"
  }
}

resource "aws_subnet" "three-tier-pub-sub-2" {
  vpc_id            = aws_vpc.three-tier-vpc.id
  cidr_block        = var.pub_sub2
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "three-tier-pub-sub-2"
  }
}


# Private Subnets
resource "aws_subnet" "three-tier-pvt-sub-1" {
  vpc_id                  = aws_vpc.three-tier-vpc.id
  cidr_block              = var.pvt_sub1
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "three-tier-pvt-sub-1"
  }
}
resource "aws_subnet" "three-tier-pvt-sub-2" {
  vpc_id                  = aws_vpc.three-tier-vpc.id
  cidr_block              = var.pvt_sub2
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "three-tier-pvt-sub-2"
  }
}

resource "aws_subnet" "three-tier-pvt-sub-3" {
  vpc_id                  = aws_vpc.three-tier-vpc.id
  cidr_block              = var.pvt_sub3
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "three-tier-pvt-sub-3"
  }
}
resource "aws_subnet" "three-tier-pvt-sub-4" {
  vpc_id                  = aws_vpc.three-tier-vpc.id
  cidr_block              = var.pvt_sub4
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "three-tier-pvt-sub-4"
  }
}
