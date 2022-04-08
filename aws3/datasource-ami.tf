data "aws_ami" "venkat-ami" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "Venkat_ami1-http" {
  ami = data.aws_ami.venkat-ami.id
  instance_type = "t2.micro"
  tags = {
      Name = "Venkat-ami-http-datasource"
  }
  user_data = file("./apps.sh")
  key_name = "venkat-key"
}