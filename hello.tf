provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

terraform {
    backend "s3" {
        bucket = "tecsbleat-simple-bucket"
        key    = "techbleat.tfstate"
        region = "eu-west-1"
    }
}

resource "aws_instance" "first_task" {
  ami           = "ami-0bfbfa28c5682b543"
  instance_type = "t2.micro"
  key_name      = "Mac1"

  tags = {
    Name        = "Our First Node"
    Provisioner = "Terraform"
  }
}
resource "aws_instance" "second_node" {
  ami                    = "ami-0bfbfa28c5682b543"
  instance_type          = "t2.micro"
  key_name               = "Mac1"
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  tags = {
    Name        = "Our Second Node"
    Provisioner = "Terraform"
  }
}
