Here we will learn how to handle outputs.

This is a key consept especially if you're working with 3rd party modules.
You may have resources and attributes you need to access.
For example lets say you're using the VPC module, 
now you got an ec2 instance you need to create.
You can take the value fro mthat module and pass it somewhere else.

In terraform, unlike most common coding languages, this is done placing the output inside the module that have that attribute set you want to output.

Let's go into our ec2 folder and see how that works.