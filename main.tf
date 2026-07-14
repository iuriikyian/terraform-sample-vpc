# Create the primary VPC for workloads
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.environment}-vpc"
    Environment = var.environment
  }
}

locals {
  public_subnet_cidr  = cidrsubnet(var.vpc_cidr, 8, 1)
  private_subnet_cidr = cidrsubnet(var.vpc_cidr, 8, 2)
}

# Create Subnets
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = local.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.environment}-public-subnet"
    Environment = var.environment
    Subnet      = "public-1"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name        = "${var.environment}-private-subnet"
    Environment = var.environment
    Subnet      = "private-1"
  }
}