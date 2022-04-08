resource "aws_instance" "Venkatec2" {
    ami = "ami-04893cdb768d0f9ee"
    instance_type = "t2.micro"
    count = 3
    tags = {
        Name = "venkat-for-instance-${count.index}"
        Env = "test"
    }
}