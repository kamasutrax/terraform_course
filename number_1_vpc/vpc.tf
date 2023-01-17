#As in our first code we will start by choosing a provider and region.
provider "aws" {
  region = "eu-central-1"
}

#Using input variable to set out vpc name with a string value.
variable "vpcname" {
    type = string
    default = "Please enter the name of your vpc:"
}

#Creating our first vpc using terraform.
#Creating a vpc looks like this:
resource "aws_vpc" "demo-vpc" {
    #Choosing cidr block, meaning what will be the IP range of the vpc.
    cidr_block = "10.0.0.0/16"
    #Giving our VPC a name tag.
    tags = {
        #Pointing our name tag to fetch the vpc name from the variable we stated earlier
        Name = var.vpcname
    }
}

#Outputting the vpc name.
output "vpcid" {
  value = aws_vpc.myvpc.id
}


