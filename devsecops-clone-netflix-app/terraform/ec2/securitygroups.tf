resource "aws_security_group" "test-public-zone-sg" {
  name   = "test-public-zone-sg"
  vpc_id = data.terraform_remote_state.dev-vpc.outputs.dev_vpc_id

  ingress = [
    for port in [22, 80, 443, 3000, 8080, 8081, 9000, 9090, 9100] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = [var.my_ip]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name : "${var.env-prefix}-test-public-zone-sg"
  }
}