#!/usr/bin/env bash

sudo su
sudo yum update -y
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -a -G ec2-user

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
yum install -y unzip
unzip awscliv2.zip
./aws/install
