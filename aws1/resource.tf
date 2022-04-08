resource "aws_instance" "database" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloVenkat"
    Env = "Dev"
  }
}

resource "aws_s3_bucket" "venkat_bucket" {
  bucket = "venkat-bucketaprsg442022"

  tags = {
    Name        = "Venkat bucket"
    Environment = "Dev"
  }
}

output "public-ip-ec" {
    description = " ec2 instanse test purpose"
    value = aws_instance.database.public_ip
}

output "bucket_id" {
    description = " ec2s3 bucket instanse test purpose"
    value = aws_s3_bucket.venkat_bucket.id
}

resource "aws_vpc" "Venkat_main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Venkat_main_vpc"
    Env = "Dev"
  }
}

resource "aws_subnet" "Venkat_private" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.Venkat_main.id
  tags = {
    Name = "Venkat_private_subnet"
    Env = "Dev-private"
  }
}

resource "aws_subnet" "Venkat_public" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.Venkat_main.id
  tags = {
    Name = "Venkat_public_subnet"
    Env = "Dev-public"
  }
}

output "vpc_id" {
    value = aws_vpc.Venkat_main.id
}

output "private_subnet_id" {
    value = aws_subnet.Venkat_private.id
}

output "public_subnet_id" {
    value = aws_subnet.Venkat_public.id
}

resource "aws_instance" "Venkat_Web" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.Venkat_public.id
  tags = {
    Name = "HelloVPCVenkat"
    Env = var.tag_env
  }
}


variable "tag_env" {
  type = string
  default = "testenv"
}