provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
}

module "aws_vpc" {
  source = "./vpc"
}

module "aws_webserver_sg" {
  source = "./security_groups"
  vpc_id = module.aws_vpc.vpcid
}

module "webserver_node" {
  source                      = "./ec2"
  subnet_id                   = module.aws_vpc.public_subnetA_id
  vpc_security_group_ids      = module.aws_webserver_sg.aws_wsg_id
  associate_public_ip_address = true
}