#Choosing provider and region.
provider "aws" {
    region = "eu-central-1"
}
#Creating the resource.
resource "aws_instance" "ec2" {
    ami = "ami-09042b2f6d07d164a"
    instance_type = "t2.micro"
}
#Implementing the elastic IP.
#First we choose the resource and name.

resource "aws_eip" "elasticeip" {
  #Now we choose where to attach this.
  #We will attach it to an instance
  #Then we need to declair which resource, resource name & the attribute.
  #aws_instance is the resouce, ec2 is the resouce name & id is the attribute.
  instance = aws_instance.ec2.id
}

#Outpputing the elastic IP.
#Note that we are pointing the output to display a value.
#A value with the following: resource - "aws_eip", resource name - "elasticeip", and attribute - "public_ip"
output "EIP" {
  value = aws_eip.elasticeip.public_ip
}