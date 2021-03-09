provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "testEC2" {
  ami = "ami-0915bcb5fa77e4892"
  instance_type = "t2.micro"
}