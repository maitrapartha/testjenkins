provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/20"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "Terraform VPC"
  }
}
resource "aws_subnet" "pub_subnet" {
  cidr_block = "10.0.1.0/22"
  vpc_id = aws_vpc.vpc.id
}
resource "aws_internet_gateway" "iGW" {
  vpc_id = aws_vpc.vpc.id
}
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iGW.id
  }
}
resource "aws_route_table_association" "route_table_association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.pub_subnet.id
}