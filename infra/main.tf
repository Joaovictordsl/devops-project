provider "aws"{
  region = "us-east-1"
}







resource "aws_instance" "server" {
   ami             = "ami-07ff62358b87c7116"
   instance_type   = "t2.micro"
}
