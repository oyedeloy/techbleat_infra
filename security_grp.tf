resource "aws_security_group" "demo_1" {
  name = "first_tera_sec_group"

  ingress {
       from_port = 22
    to_port = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_block = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}