#Choosing service provider and region. 
#I use eu-central (Frankfurt) since it's closest to me
#But you can choose w/e you like.
provider "aws" {
    region = "eu-central-1"
}

#Creating our very first ubuntu instance.
#You can choose different AMI to create different types of instances.
resource "aws_instance" "ec2" {
    ami = "	ami-09042b2f6d07d164a"
    instance_type = "t2.micro"
}
