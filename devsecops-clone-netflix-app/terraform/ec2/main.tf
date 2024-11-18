resource "aws_instance" "public-instance_1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.ec2_instance_profile.name
  associate_public_ip_address = true
  subnet_id                   = data.terraform_remote_state.dev-vpc.outputs.public_subnet[0]
  vpc_security_group_ids      = [aws_security_group.test-public-zone-sg.id]
  availability_zone           = var.ap-southeast-1-azs[0]
  user_data                   = file("install-jenkins-sonar.sh")

  root_block_device {
    volume_size = 40
  }

  tags = {
    Name = "Jenkins-SonarQube"
  }
}

resource "aws_instance" "public-instance_2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.ec2_instance_profile.name
  associate_public_ip_address = true
  subnet_id                   = data.terraform_remote_state.dev-vpc.outputs.public_subnet[0]
  vpc_security_group_ids      = [aws_security_group.test-public-zone-sg.id]
  availability_zone           = var.ap-southeast-1-azs[0]
  user_data                   = file("install-prometheus-grafana.sh")

  root_block_device {
    volume_size = 40
  }

  tags = {
    Name = "prometheus-grafana"
  }
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach AmazonSSMManagedInstanceCore policy to the IAM role
resource "aws_iam_role_policy_attachment" "ec2_role_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.ec2_role.name
}

# Create an instance profile for the EC2 instance and associate the IAM role
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "EC2_SSM_Instance_Profile"
  role = aws_iam_role.ec2_role.name
}