#Choose the provider & region
provider "aws" {
    region = "eu-central-1"
}

#Create ec2 instance and attaching the security group to it
resource "aws_instance" "ec2" {
    ami = "ami-09042b2f6d07d164a"
    instance_type = "t2.micro"
    #Attaching the security group
    security_groups = [aws_security_group.aws_sg.name]
}

#First list variable we will use in our SG.
#We create a variable and name it ingressrules.
variable "ingressrules" {
  #We set the type of the variable to list(number)
  type = list(number)
  #We add the default which will indicate to the code to use those numbers.
  default = [80,443]
}
#Second list of variable we will use.
variable "egressrules" {
  type = list(number)
  #As you can see, we can add as many numbers into the list as we wish. 
  #Same goes to for ingress (Inbound rules), 
  #just remember to minimize the risk when creating such variables as they will act as point of possible entry to attacks.
  default = [80,443,25,11443,53,8080]
}

#Lets create the security group and give it a name.
resource "aws_security_group" "aws_sg" {
  name = "Allow HTTPS"
  #Adding the ingress rule variable to the security group.
  dynamic "ingress" {
    #Stating what the numbers in the variable will be used for. "interator = port"
    iterator = port
    #Stating what variable to use. we can set the same variable for both ingress and egress rules if we want to.
    #We can set one list variable and use it repeatedly in many SGs.
    for_each = var.ingressrules
    content {
      #This will look similar to creating regular SG but we will use the variable here as well.
    from_port = port.value
    to_port = port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }
  #Creating the dynamic block for the egress rules.
  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
    from_port = port.value
    to_port = port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

#Now we create the elastic IP for the machine to use.
resource "aws_eip" "elasticeip" {
  instance = aws_instance.ec2.id
}
#Since we generally want to be using our code instead of connecting to the AWS interface.
#we want to output the public IP to make sure everything works as expected.
output "EIP" {
  value = aws_eip.elasticeip.public_ip
}