terraform {
  backend "s3" {
    bucket = "ecsbackend01"
    key    = "state.tfstate"
    region = "us-east-1"
  }
}