resource "aws_instance" "import_vm" {
    ami = "ami-0c4a11a8d0e503812"
    instance_type = "t2.micro"
    tags = {
        Name = "Hello_Bhav"
        env = "PROD"
        Owner = "venkat"
    }
}