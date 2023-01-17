#Choose the provider to use
provider "aws" {
  region = "eu-central-1"
}

#Create db instance, choosing type and tagging with a name
resource "aws_instance" "db" {
    ami = "ami-09042b2f6d07d164a"
    instance_type = "t2.micro"
    tags = {
        Name = "db Server"
    }
}

#Create web server, choosing type, adding security group, tagging with a name
resource "aws_instance" "web" {
    ami = "ami-09042b2f6d07d164a"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.allow_web_acces.name]
    #Using user_data to run the script
    user_data = file("server-script.sh")
    tags = {
        Name = "web Server"
    }
}

#Creating ElasticIP and attachin to web server
resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id
}

#Create security group variables
variable "ingressrules" {
  type = list(number)
  default = [80,443]
}
variable "egressrules" {
  type = list(number)
  default = [80,443]
} 

#Creating the security group and adding variables 
resource "aws_security_group" "allow_web_acces" {
  name = "Allow HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
    from_port = port.value
    to_port = port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }
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

#Outputting the web server public IP and the db server private IP
output "EIP" {
  value = aws_eip.web_ip.public_ip
}
output "private_ip" {
  value = aws_instance.db.private_ip
}
