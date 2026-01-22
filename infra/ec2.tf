resource "tls_private_key" "rsa_key" {

   algorithm = "RSA"
   rsa_bits = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name = "my-key-terraform"
  public_key = tls_private_key.rsa_key.public_key_oppenssh

}

resource "local_file" "private_key"{
  content = tls_private_key.rsa_key.private_key_pem
  filename = "my-key-terraform.pem"
}


resource "aws_instance" "website-server"{
  ami = "ami-07ff62358b87c7116"
  instance_type = "t2.micro"
  key_name = aws_key_pair.key_pair.key_name

  tags = {
    Name = "website-server"
    Provisioned = "Terraform"
  }

}
