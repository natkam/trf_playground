provider "aws" {
  region     = "${var.region}"
  version = "~> 1.21"
}

resource "aws_instance" "example" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  depends_on    = ["aws_s3_bucket.bucket_ex"]

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_add_1.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

resource "aws_s3_bucket" "bucket_ex" {
  bucket = "2106-natkam"
  acl = "public-read"
}

resource "aws_s3_bucket_object" "pic" {
  bucket = "${aws_s3_bucket.bucket_ex.bucket}"
  key = "funny_cat.jpg"
  source = "./sad_cat.jpg"
  acl = "public-read"
  content_type = "image/jpeg"
}

output "ami" {
  value = "${lookup(var.amis, var.region)}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
