module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"
  # insert the 23 required variables here

  # VPC Basic Details
  name = "venkat-tf-vpc"
  cidr = "172.0.0.0/16"   
  azs                 = ["us-east-2a", "us-east-2b"]
  private_subnets     = ["172.0.1.0/24", "172.0.2.0/24"]
  public_subnets      = ["172.0.101.0/24", "172.0.102.0/24"]

  # Database Subnets
  create_database_subnet_group = true
  create_database_subnet_route_table= true
  database_subnets    = ["172.0.151.0/24", "172.0.152.0/24"]

  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "venkat-tf-public-subnets"
  }

  private_subnet_tags = {
    Type = "venkat-tf-private-subnets"
  }

  database_subnet_tags = {
    Type = "venkat-tf-database-subnets"
  }

  tags = {
    Owner = "venkat-tf-vpc"
    Environment = "dev-tf"
  }

  vpc_tags = {
    Name = "venkat-tf-vpc-dev"
  }
}
