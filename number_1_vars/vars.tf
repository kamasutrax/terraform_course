#String var expamle.
#1 of the more common 
variable "vpcname" {
    type = string
    default = "myvpc"
}
#Number var example.
#numbers and not commonly used because there are better options.
variable "sshport" {
    type = number
    default = 22
}
#Boolean var exmaple
variable "enabled" {
    default = true
}

variable "mylist" {
  type = list(string)
    default = [ "value1", "value2", "value3" ]
}

variable "mymapping" {
  type = map
  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}

variable "inputname" {
  type = string
  description = "Set the name of the VPC"
}

resource "aws_vpc" "demo-vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = var.inputname
    }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

variable "mytuple" {
  type = tuple([string , number . string])
  default = ["cat" , 1 , "dog"]
}

variable "myobject" {
  type = object({name = string, port = list(number)})
  default {
    name = "Roi"
    port = [22, 25, 80]
  }
}