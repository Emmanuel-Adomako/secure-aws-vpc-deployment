# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Create a Virtual Private Cloud (VPC)
resource "aws_vpc" "enterprise_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "Production-VPC"
    Environment = "Prod"
    ManagedBy   = "Terraform"
  }
}

# Create a Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.enterprise_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-1"
  }
}

# Create a Private Subnet (Strict Access)
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.enterprise_vpc.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "Private-Subnet-1"
  }
}
