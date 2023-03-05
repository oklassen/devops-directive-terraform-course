terraform {

  //which provider we will use -> aws provider with specified version
  // provider which provides info to terraform how we can connect to aws api

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
// default region for this provider
provider "aws" {
  region = "us-east-1"
}

// "example" - instance within ec2
// AMI- Amazon Machine Image- contains set of information required to create EC2 VM. From it there can be created multiple ec2 instances
// information -> (like OS, region where we want to start the ec2, architecture (32,64 bit), storage for root device (Elastic Block Store))
// here are all the options we can configure https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
//resource    type         name
resource "aws_instance" "example" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
}

// commands - inside directory with tf script

/*
terraform init-
  downloads the provider we've specified and puts the code inside working directory into .terraform directory
  if you use the modules it will download them
  creates state file - current state
    json file where is described which resources were deployed and all info eg (IP of ec2, arn, ami..)
    contains sensitive data like passwords
    can be stored in s3
    can be locked in dynamodb table

*/
/*
terraform plan -
  will take the config script (desired state) and compare with terraform state
  eg if the config file contains more vms as state it will create plan to provision more nd send to aws provider
  and configure sequence of api calls that are necessary

 */

/*
terraform apply -
  will run this sequence from plan and create eg new resource

 */
// terraform destroy - will destroy all resources
