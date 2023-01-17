Before we get started lets go over the basic codes used in terraform.

first of remember to always create a folder for every code you create
In order to init our terraform code in a specific directory.

After you *.tf file is ready you will want to first of all use the code -- terraform init
Terraform init will initialize the terraform to use that folder.

After the init is done you will want to use --  terraform apply
Terraform apply will give you the output of what you are about to create.
After the output it will ask for final confirmation, once confirmed the process will start.
All the changes you typed into your *.tf file will run and be created on the cloud provider you choose.

*We will use AWS for this course.

Assuming you dont want to leave those machines active and spend your money needlessly.
After checking that your code ran successfully on AWS you will want to delete the resources.
In order to do so you will use the code -- terraform destroy
Terraform destroy will give you the output of what you about to delete.
Terraform destroy will revert everything done from the apply and destroy all the resources stated in the *.tf file.

Please read the README files in every folder to better understand what we are doing.

There are more terraform commands you can go over user terraform -help
