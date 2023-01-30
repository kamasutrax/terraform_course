#As always, we choose the provider and region
provider "aws" {
  region = "eu-central-1"
}

#Lets create our very first user using terraform
resource "aws_iam_user" "myUser" {
    name = "kamasutrax"
}

#Lets create the iam policy resource.
resource "aws_iam_policy" "myPolicy" {
    #Remember to give each iam policy a unique name.
    #It will help you when you want to deploy in large environments.
    name = "GlacierEFSec2"
    #You may ask why we need to do it in a code instead of the GUI.
    #There are many reasons why but some of the main ones are:
    #1. Security policy
    #2. It's easier to modify here if you have several VPC's and need to deploy the same IAM on alll of them.
    #Now we are going to add the policy. 
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "elasticfilesystem:DeleteAccessPoint",
                "glacier:AbortMultipartUpload",
                "elasticfilesystem:UntagResource",
                "elasticfilesystem:PutAccountPreferences",
                "elasticfilesystem:CreateFileSystem",
                "glacier:CreateVault",
                "elasticfilesystem:DeleteReplicationConfiguration",
                "elasticfilesystem:ClientWrite",
                "glacier:ListParts",
                "elasticfilesystem:CreateReplicationConfiguration",
                "elasticfilesystem:DeleteTags",
                "glacier:DeleteVaultNotifications",
                "glacier:ListJobs",
                "glacier:InitiateMultipartUpload",
                "elasticfilesystem:PutLifecycleConfiguration",
                "glacier:PurchaseProvisionedCapacity",
                "glacier:UploadArchive",
                "elasticfilesystem:DeleteMountTarget",
                "elasticfilesystem:CreateAccessPoint",
                "elasticfilesystem:ModifyMountTargetSecurityGroups",
                "glacier:InitiateJob",
                "elasticfilesystem:Restore",
                "glacier:ListTagsForVault",
                "glacier:DeleteVault",
                "glacier:DeleteArchive",
                "elasticfilesystem:TagResource",
                "elasticfilesystem:CreateTags",
                "elasticfilesystem:CreateMountTarget",
                "glacier:ListMultipartUploads",
                "glacier:SetVaultNotifications",
                "glacier:CompleteMultipartUpload",
                "ec2:*",
                "glacier:UploadMultipartPart",
                "elasticfilesystem:Backup",
                "elasticfilesystem:PutBackupPolicy",
                "elasticfilesystem:ClientRootAccess",
                "glacier:ListVaults",
                "glacier:ListProvisionedCapacity",
                "elasticfilesystem:DeleteFileSystem",
                "elasticfilesystem:UpdateFileSystem"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

#Now after we have our user and the IAM policy let's attach the policy to the user.
resource "aws_iam_policy_attachment" "policyBind" {
    #Give it a name.
    name = "attachment"
    #Choose the users you want to attach it to.
    users = [aws_iam_user.myUser.name]
    policy_arn = aws_iam_policy.myPolicy.arn
}

#Now lets init and apply and see how it works.
#After running the code you can go to users,
#you will see the new user created and you will see permissions policies attached it.
#Now lets destroy it.