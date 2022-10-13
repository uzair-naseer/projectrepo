#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y
sudo yum install git -y
git clone https://github.com/uzair-naseer/projectrepo.git
cd projectrepo
sudo ansible-playbook project.yml

