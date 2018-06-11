terraform {
  backend "consul" {
    address = "demo.consul.io"
    path    = "getting-started-natka2106"
    lock    = false
    scheme = "https"
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "natka" {
  ami = "ami-9a91b371"
  instance_type = "t2.micro"
}
