resource "aws_instance" "moduleec2" {
    ami = "ami-064ff912f78e3e561"
    instance_type = "t2.micro"
        tags = {
        Name = "venkat-module-ec2"
        Env = "test"
    }
}