provider "aws"{
  region = "us-east-1"
}

resource "aws_ecr_repository" "ecr_repository" {
  

}

resource "aws_security_group" "securitygroup"{
  name = "securitygroup"
  description = "Allow HTTP request and internet"

  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress{
    from_port = 0 
    to_port = 65350
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "server" {
   ami             = "ami-07ff62358b87c7116"
   instance_type   = "t2.micro"
   user_data = file("user_data.sh")
   vpc_security_groups_ids = [aws_security_group.securitygroup.id]
 } 
















