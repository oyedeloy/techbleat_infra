provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

terraform {
    backend "s3" {
        bucket = "Wek_2-del-devops-bucket"
        key    = "devops_key"
        region = "us-east-2"
    }
}

resource "aws_instance" "first_node" {
  ami                    = "ami-04cd019702b8c27b8"
  instance_type          = "t2.micro"
  key_name               = "devops_key"
  vpc_security_group_ids = [aws_security_group.demo_2.id]

  tags = {
    Name        = "Toolbox_1"
    Provisioner = "Terraform"
    Test        = "yes_no"
  }
}
resource "aws_instance" "second_node" {
  ami                    = "ami-04cd019702b8c27b8"
  instance_type          = "t2.micro"
  key_name               = "devops_key"
  vpc_security_group_ids = [aws_security_group.demo_2.id]

  tags = {
    Name        = "Toolbox_2"
    Provisioner = "Terraform"
  }
}
