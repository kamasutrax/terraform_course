#So here I split the whole code as much as possible.
#Creating different codes to implement different types of resources.
#Here we will deploy our elastic IP.

#We cut the eip deployment.

variable "instance_id" {
  type = string
}
resource "aws_eip" "web_ip" {
  instance = var.instance_id
}

#Also the eip output.
output "PublicIP" {
  value = aws_eip.web_ip.public_ip
}