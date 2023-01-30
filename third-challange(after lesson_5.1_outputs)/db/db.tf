#Here we will create our db server from challange2 
#so we simply copy the resource from the challange3.tf file (used to be challange2.tf)
#Notice I cut this from challange.tf file
resource "aws_instance" "db" {
    ami = "ami-09042b2f6d07d164a"
    instance_type = "t2.micro"
    tags = {
        Name = "db Server"
    }
}

#We also need the output so I copied the output as well.
#Notice that this time I copied it instead of cutting it.
output "private_ip" {
  value = aws_instance.db.private_ip
}