resource "aws_instance" "Venkatforeach" {
    ami = each.value[1]
    instance_type = each.value[2]
    availability_zone = each.value[0]
    for_each = {
        firstlab_vm = ["ap-south-1a","ami-04893cdb768d0f9ee","t3.small"]
        secondlab_vm = ["ap-south-1b","ami-04893cdb768d0f9ee","t2.micro"]
    }
    tags = {
        Name = each.key
    }
}