resource "aws_instance" "test-apsouth" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloVenkatapsouth-lifecycle"
    Env = "Dev"
  }
  lifecycle {
    create_before_destroy = true
    ignore_changes = [tags]
  }
    provider = aws.useast
}

resource "aws_instance" "test-useast" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloVenkatuseast-lifecycle"
    Env = "Dev"
  }
}

#resource "aws_eip" "eip"{
#    instance = aws_instance.test-apsouth.id
#    tags = {
#        Name = "EIPtest"
#    }
#    depends_on = [aws_instance.test-apsouth]
#}
