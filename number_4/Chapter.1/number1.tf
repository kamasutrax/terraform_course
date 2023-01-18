#Choose the provider & region
provider "aws" {
    region = "eu-central-1"
}

#Lets create the security group
resource "aws_security_group" "webtraffic" {
  #Give it a name
  name = "Allow HTTPS"

  #Now we need to set our ingress (inbound rules)
  ingress {
    from_port = 443
    #We use the to_port parameter because sometimes we want to use a range of ports. for example 443-30000
    #In that case we will use from_port = 443 to_port = 30000.
    to_port = 443
    #Stating the protocol to use
    protocol = "TCP"
    #Now we choose which cidr block is allowed to connect to the server using the specified port
    cidr_blocks = ["0.0.0.0/0"]
    #We choose 0.0.0.0/0 for thie example as this will allow everyone fron all over the world to enter.
    #Rembmer the cidr_block is a list and you can also put your private IP address or any other addresses you wish.
    
  }
  #Now lets set our egress (outbound rules)
  #As I mentioned in the README, there is no real need to set it but we will do so just to make sure everything
  #Works smoothly. & and it's good to learn.
  egress{
    #For our egress we will use the same rules as the ingress.
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#And Finally we will create our instance
resource "aws_instance" "ec2" {
    ami = "ami-09042b2f6d07d164a"
    instance_type = "t2.micro"
    #And attache the security group to the instance.
    security_groups = [aws_security_group.webtraffic.name]
}

