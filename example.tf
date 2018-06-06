provider "aws" {
    region     = "eu-central-1"
    version = "~> 1.21"
}

resource "aws_instance" "example" {
    ami           = "ami-9a91b371"
    instance_type = "t2.micro"
    depends_on    = ["aws_s3_bucket.bucket_ex"]
    
    provisioner "local-exec" {
        command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
        command = "mkdir prov"
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
