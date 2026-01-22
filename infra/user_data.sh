#!/usr/bin/env bash

sudo su
sudo yum update -y
yum install -y docker
service docker start
usermod -a -G ec2-user
