provider "aws"{
  region = "us-east-1"
}

resource "aws_security_group" "security_group"{
  name = "security_group"
  description = "Allow HTTP access" 

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0 
    to_port = 65350
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "resource "aws_instance" "server" {
   ami             = "ami-07ff62358b87c7116"
   instance_type   = "t2.micro"

  }
