#Choose the provider & region
provider "aws" {
    region = "eu-central-1"
}

#Here we will attach the brand new Module input.
module "ec2module" {
   #Now we will need to tell the module where the module folder is.
   #After this statement this module will use everything in the folder ec2 as a module.
  source = "./ec2"
  #Now we will pass in a string value, 
  #we can use which ever var we want as long as it corelates with the variable inside our module folder.
  ec2name = "Name From Module"
}

#After running terraform init you can notice that it will initialize the module as well.
#Something key to know: If you make any changes to the module folder you will need to re-do the terraform init.
#Now if you go to the EC2 on AWS you can see that a new instance created with the name we given here.
