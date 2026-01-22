// KEY PAIR - begin 
resource "tls_private_key" "rsa_key" {

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = "my-key-terraform"
  public_key = tls_private_key.rsa_key.public_key_openssh

}

resource "local_file" "private_key" {
  content  = tls_private_key.rsa_key.private_key_pem
  filename = "my-key-terraform.pem"
}
// KEY PAIR - end



// SECURITY GROUP - start 

resource "aws_security_group" "security_group" {
  name        = "security_group"
  description = "Allow SSH from my IP, HTTP/HTTPS access"

  tags = {
    Name        = "website"
    Provisioned = "terraform"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["191.185.181.57/32"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65350
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// SECURITY GROUP - end






// EC2 INSTANCE 

resource "aws_instance" "website-server" {
  ami                    = "ami-07ff62358b87c7116"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  tags = {
    Name        = "website-server"
    Provisioned = "Terraform"
  }

}
