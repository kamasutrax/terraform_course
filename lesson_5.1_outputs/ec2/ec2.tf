#Creating a variable.
variable "ec2name" {
  type = string
}

#Creating the ec2 instance.
resource "aws_instance" "ec2" {
    ami = "ami-09042b2f6d07d164a"
    instance_type = "t2.micro"
    #attach the variable to to this instance.
    tags = {
        Name = var.ec2name
    }
}
#Making our output.
output "instance_id" {
  #This can be any attribute you want it to be.
  value = aws_instance.ec2.id
}
#Now let's head back to our main.tf file.