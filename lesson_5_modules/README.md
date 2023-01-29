Hi there.

In this lesson we will learn about modules, what they are, how they are used and how to implement them.
A module is essentially a folder with code inside it.

Up until now we created a file for each lesson and called it main.tf
Inside the main.tf we coded in all the elements we wanted to create.
When using a module we can create a folder and use different codes inside it and we can modulate each code to fit our needs.

For example: in our latest challange we created 2 seperate EC2 instances in our challange2.tf file.
If we were to use a module we could put it inside a module and use it 2 times with small modulation and create the 2 differnet instances.

Here we will use our main.tf file to run the terraform code and have another folder called ec2 which we will use as our module.
Let's jump through and see how it works.