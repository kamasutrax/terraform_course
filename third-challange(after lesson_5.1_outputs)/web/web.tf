#So we cut the rest of the resource creating since it all relates to our web server.
resource "aws_instance" "web" {
    ami = "ami-09042b2f6d07d164a"
    instance_type = "t2.micro"
    #We direct the sg to use the module we set in the sg module
    security_groups = [module.sg.sg_name]
    #Using user_data to run the script
    #We need to change the location of the file.
    user_data = file("./web/server-script.sh")
    tags = {
        Name = "web Server"
    }
}
#Here we take the output from eip.tf file in order to publish it to the main tf file
output "pub_ip" {
    value = module.eip.PublicIP
}

#Now to modulate the eip
module "eip" {
    source = "../eip"
    instance_id = aws_instance.web.id
}
#and modulate the security group
module "sg" {
    source = "../sg"
}