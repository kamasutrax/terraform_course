#Choose the provider & region
provider "aws" {
  region = "eu-central-1"
}
#Now that we cleared the space we will create our modules.
module "db" {
  source = "./db"
}
module "web" {
  source = "./web"
}

#We want to change the value from aws_eip to module.
output "PublicIP" {
  value = module.web.pub_ip
}
#We want to change the value from aws_instance to module.
output "private_ip" {
  value = module.db.private_ip
}


#Now that we've set everything we need. 
#Lets run terraform init and than apply our changes and see how it goes.