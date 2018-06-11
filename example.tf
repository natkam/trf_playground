provider "aws" {
  region     = "${var.region}"
}

module "consul" {
  source = "hashicorp/consul/aws"

//  aws_region = "${var.region}"  # wtf? Error: module "consul": "aws_region" is not a valid argument
  num_servers = "3"
}

output "consul_server_asg_name" {
  value = "${module.consul.asg_name_servers}"
}
