resource "aws_instance" "my_public_server" {
  ami                    = data.aws_ami.aws_basic_linux.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.canary-vpc-public-a.id
  vpc_security_group_ids = [aws_security_group.my_public_app_sg.id]
  key_name               = var.my_keypair
  iam_instance_profile   = aws_iam_instance_profile.dashboard_server_profile.id

  tags = {
    Name = "public_server"
  }
}
