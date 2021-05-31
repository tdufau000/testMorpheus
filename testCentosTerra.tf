provider "aws" {
   profile    = "default"
   region     = "eu-west-1"
}

resource "aws_instance" "server1" {
   ami           = "ami-045fa58af83eb0ff4"
   instance_type = "t2.micro"
   key_name      = "key-pair-morphAWS"
}

resource "aws_default_vpc" "default" {
   tags = {
     Name = "morph-vpc-"
   }
}

resource "aws_default_security_group" "default" {
   vpc_id      = "${aws_default_vpc.default.id}"
 ingress {
     # TLS (change to whatever ports you need)
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
     # Please restrict your ingress to only necessary IPs and ports.
     # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
     cidr_blocks     = ["83.68.192.4/32"]
   }
 egress {
     from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = ["0.0.0.0/0"]
   }
}