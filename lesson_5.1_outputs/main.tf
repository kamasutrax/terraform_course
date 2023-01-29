#Choose the provider & region
provider "aws" {
    region = "eu-central-1"
}

#Here we will attach the brand new Module input.
module "ec2module" {

  source = "./ec2"
  ec2name = "Name From Module"
}

#Now we will need to add a second output.
output "module_output" {
   #Here we will give the value to output in instance id. you can access any type of inforamtion.
  value = module.ec2module.instance_id
}

#Now lets init and apply and see what the output gives us.

#Now that we've seen how we can use outputs to gather data from our modules.
#I will be glad to inform you that there is a library stocked with modules for your every need.
#You can simply search for terraform registry, 
#log-in with your git account and have access to thousands of modules all ready to deploy into your terraform code.