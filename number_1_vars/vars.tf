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
#Boolian will be used in times we want to generate loops for our terraform code.
#Boolian is not commonly used in terraform
variable "enabled" {
    default = true / false
}
#List var example.
#Lists are the most common variables in terraform code.
#In lists we can add both numbers and strings.
variable "mylist" {
  type = list(string)
    default = [ "value1", "value2" , "value3" ]
}
#Maps are key vaule pairs.
#You can use maps to set variables in advance.
#You can use the variables set on map multiple times in your code and it can save you a lot of time.
variable "mymapping" {
  type = map
  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = 22
  }
}
#Input var example.
#We can use input variables when we want to set our names manually when creating new resources.
variable "inputname" {
  type = string
  description = "Please enter the name of your vpc:"
}

#Tuples are similar to a list but in tuple we can use both strings and numbers.
#We will usually use strings but there are exeptions.
variable "mytuple" {
  type = tuple([string , number . string])
  default = ["cat" , 1 , "dog"]
}

#Object variables are similiar to map vairables.
#With the exception of been able to use different data types.
#
variable "myobject" {
  type = object({name = string, port = list(number)})
  default {
    name = "Roi"
    port = [22, 25, 80]
  }
}