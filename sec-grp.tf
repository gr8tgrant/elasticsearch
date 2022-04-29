resource "aws_security_group" "my_private_sg" {
  name        = "my_private_sg"
  description = "Allow access to the server"
  vpc_id      = data.aws_vpc.main_vpc.id


  # INBOUND CONNECTIONS
  ingress {
    description     = "allow ssh to specific IPs"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description     = "For connection to ElasticSearch Server"
    from_port       = 9200
    to_port         = 9200
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  egress {
    description = "Allow access to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
  }
}