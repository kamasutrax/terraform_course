#Choose the provider to use
provider "aws" {
  region = "eu-central-1"
}

#Create db instance, choosing type and tagging with a name
resource "aws_instance" "challange_server_1" {
    ami = "ami-09042b2f6d07d164a"
    instance_type = "t2.micro"
    tags = {
        Name = "my first challange"
    }
}

resource "aws_vpc" "challange_vpc_1" {
  cidr_block = "192.168.0.0/24"
  tags = {
    name = "TerraformVPC"
  }
}