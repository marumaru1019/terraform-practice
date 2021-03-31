provider "aws" {
  version = "2.67.0"
  region  = "ap-northeast-1"
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}
