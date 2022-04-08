data "aws_vpc" "datasourceVPC" {
    id = "vpc-0b71c70d33355bd05"
}

resource "aws_subnet" "datasourcesubnet" {
    cidr_block = "10.0.100.0/24"
    vpc_id = data.aws_vpc.datasourceVPC.id
  tags = {
    Name = "Venkat_datasource_subnet"
    Env = "Dev-datasource"
  }
}


resource "aws_network_interface" "Venkat_foo" {
  subnet_id   = aws_subnet.datasourcesubnet.id
  private_ips = ["10.0.100.100"]
  tags = {
    Name = "Venkatprimary_network_interface"
  }
}

resource "aws_instance" "Venkat_foo1" {
  ami           = "ami-0c02fb55956c7d316"
#  ami = "data.aws_ami.venkat-ami.id"
  instance_type = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.Venkat_foo.id
    device_index         = 0
  }
  tags = {
      Name = "Venkat-datasource"
  }
}