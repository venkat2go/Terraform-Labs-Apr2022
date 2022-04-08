resource "aws_subnet" "Venkat_foreach" {
    cidr_block = each.value[0]
    vpc_id = aws_vpc.Venkat_main.id
    availability_zone = each.value[1]
    for_each = {
        firstlab_subnet = [ "10.0.3.0/24", "ap-south-1a"]
        secondlab_subnet = [ "10.0.4.0/24", "ap-south-1b"]
        thirdlab_subnet = [ "10.0.5.0/24", "ap-south-1c"]
    }
  tags = {
    Name = each.key
    Env = "Dev-foreach"
  }
}