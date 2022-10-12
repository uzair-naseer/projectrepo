provider "aws" {
  region = "ap-south-1"
  assume_role {
    role_arn = "arn:aws:iam::211242585972:role/roleforproject"
  }
}
resource "aws_security_group" "project_sg" {
  name        = "sec-grp"
  description = "allow httt and ssh trafic via terraform"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "project_machine" {
  ami           = "ami-01216e7612243e0ef"
  instance_type = "t2.micro"
  key_name      = "Project"
  count         = "1"
  user_data     = file("userdata.sh")

  tags = {
    Name        = "project machine"
    Environment = "Demo"
  }
}
