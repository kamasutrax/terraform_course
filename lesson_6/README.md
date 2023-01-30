Hi there.

In lesson 6 we will learn about IAM (user control)
And how to create and manipulate iam roles using terraform.

IAM policy are written in .json files.
Here is a quick and simple hack on how to deploy them using code for easier deployment.

In AWS go to IAM and click on Policies - Create Policy.
This will open a new page where you can modify the services you want and you will have a json tab you can click on to see how the policy will look like in code.

So the policies we want to use for this project are as follows:
For service we choose glacier, this is AWS cold storage, allowing us to keep logs and files for long periods of time.(Remember this is just a demonstration)
Then in resources we will choose all.

Now you can go to the JSON tab and see there's more lines added.
Let's make it even bigger:
At the bottonm right you have "Add additional permissions" click on it.
For service choose EC2
For Actions choose All EC2 Actions, since there are a lot of actions that can be done and it exceeds the line number that AWS can get.
Let's add even more permissions.
This time we will choose EFS for Service and add Write and Tagging.

Now if we go to the JSON tab we will be able to see a long script.
Many lines for glacier, some lines indicating efs (elasticffilesystem) and 1 line for ec2 giving it all access.

Now let's go to our main.tf file to see how we can deploy this code.