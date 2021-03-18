terraform {
  backend "s3" {
    bucket = "ecsbackend01"
    key    = "try2.state.tfstate"
    region = "us-east-1"

  }
}