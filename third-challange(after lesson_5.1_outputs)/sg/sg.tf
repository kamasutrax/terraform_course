#So here I split the whole code as much as possible.
#Creating different codes to implement different types of resources.
#Here we will deploy our security group.

#Create security group variables
variable "ingressrules" {
  type = list(number)
  default = [80,443]
}
variable "egressrules" {
  type = list(number)
  default = [80,443]
} 

output "sg_name" {
  value = aws_security_group.web_traffic.name
}

#Creating the security group and adding variables 
resource "aws_security_group" "web_traffic" {
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
