resource "aws_default_vpc" "default" {
   tags = {
     Name = "morph-vpc-"
   }
 }