variable "istest" {}

resource "aws_instance" "dev" {
   ami = "ami-064ff912f78e3e561"
   instance_type = "t2.micro"
   count = var.istest == true ? 3 : 0
   tags = local.com_tags
}

resource "aws_instance" "prod" {
   ami = "ami-064ff912f78e3e561"
   instance_type = "t2.large"
   count = var.istest == false ? 1 : 0
   tags = local.com_tags
}

