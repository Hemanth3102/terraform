# Creating Security Group 
resource "aws_security_group" "ec2sg" {
  vpc_id = "${aws_vpc.demovpc.id}"
# Inbound Rules
# HTTP access from anywhere
ingress {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  security_groups = [aws_security_group.demosg.id]
}
# Outbound Rules
# Internet access to anywhere
egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
tags = {
  Name = "Web SG"
}
}