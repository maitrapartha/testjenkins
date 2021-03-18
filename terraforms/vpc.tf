resource "aws_vpc" "demo2-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "Demo2 TF VPC"
  }
}

## define public subnet
resource "aws_subnet" "demo2-PubSN-1" {
  cidr_block = "10.0.0.1/22"
  vpc_id = aws_vpc.demo2-vpc.id
  tags = {
    Name = "Demo2 Public Subnet - 1"
  }
}

## internet gateway
resource "aws_internet_gateway" "demo2-IG" {
  vpc_id = aws_vpc.demo2-vpc.id
  tags = {
    Name = "Demo2 IGW"
  }
}

## route table for public subnet
resource "aws_route_table" "demo2PubSN1-0RT" {
  vpc_id = aws_vpc.demo2-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    egress_only_gateway_id = aws_internet_gateway.demo2-IG.id
  }
  tags = {
    Name = "Demo2 Route table"
  }
}

#route table association to the public subnet
resource "aws_route_table_association" "demo2PubSN1-0RT-association" {
  subnet_id = aws_subnet.demo2-PubSN-1.id
  route_table_id = aws_route_table.demo2PubSN1-0RT.id
}

##### ECS instance security group
resource "aws_security_group" "demo2-public-security-group" {
  vpc_id = aws_vpc.demo2-vpc.id
  name = "Demo2 public security group"
  description = "public access security group"
  ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  egress {
    # allow all traffic to private SN
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "Demo2 Public security grp"
  }
}
