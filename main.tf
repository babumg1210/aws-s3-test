provider "aws" {
  region = "us-east-1"
}

variable "ami_id" {
  default = "ami-xxxxxxxx" # Replace with the correct AMI ID
}

locals {
  instance_counts = {
    zuul     = 1
    eureka   = 1
    auth     = 2
    product  = 2
    order    = 2
    user     = 2
  }
  instance_types = {
    philippines = "t3.micro"
    india       = "t3.micro"
    pakistan    = {
      general = "t3.micro"
      high_mem = "t3.small"
    }
  }
}

# Philippines Configuration (Zuul, Eureka, Auth, Product, Order, User Services)

# India Configuration
module "vpc_in" {
  source = "./modules/vpc"
  cidr_block = "10.1.0.0/16"
  public_subnet_cidr = "10.1.1.0/24"
  private_subnet_cidr = "10.1.2.0/24"
}

module "security_group_in" {
  source = "./modules/security_group"
  vpc_id = module.vpc_in.vpc_id
}

module "zuul_service_in" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.zuul
  ami_id            = var.ami_id
  instance_type     = local.instance_types.india
  subnet_id         = module.vpc_in.public_subnet_id
  security_groups   = [module.security_group_in.web_sg_id]
  instance_name     = "Zuul Service IN"
  country           = "India"
  volume_size       = 20
  volume_type       = "gp2"
}

module "eureka_service_in" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.eureka
  ami_id            = var.ami_id
  instance_type     = local.instance_types.india
  subnet_id         = module.vpc_in.public_subnet_id
  security_groups   = [module.security_group_in.web_sg_id]
  instance_name     = "Eureka Service IN"
  country           = "India"
  volume_size       = 20
  volume_type       = "gp2"
}

module "auth_service_in" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.auth
  ami_id            = var.ami_id
  instance_type     = local.instance_types.india
  subnet_id         = module.vpc_in.private_subnet_id
  security_groups   = [module.security_group_in.app_sg_id]
  instance_name     = "Auth Service IN"
  country           = "India"
  volume_size       = 20
  volume_type       = "gp2"
}

module "product_service_in" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.product
  ami_id            = var.ami_id
  instance_type     = local.instance_types.india
  subnet_id         = module.vpc_in.private_subnet_id
  security_groups   = [module.security_group_in.app_sg_id]
  instance_name     = "Product Service IN"
  country           = "India"
  volume_size       = 20
  volume_type       = "gp2"
}

module "order_service_in" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.order
  ami_id            = var.ami_id
  instance_type     = local.instance_types.india
  subnet_id         = module.vpc_in.private_subnet_id
  security_groups   = [module.security_group_in.app_sg_id]
  instance_name     = "Order Service IN"
  country           = "India"
  volume_size       = 20
  volume_type       = "gp2"
}

module "user_service_in" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.user
  ami_id            = var.ami_id
  instance_type     = local.instance_types.india
  subnet_id         = module.vpc_in.private_subnet_id
  security_groups   = [module.security_group_in.app_sg_id]
  instance_name     = "User Service IN"
  country           = "India"
  volume_size       = 20
  volume_type       = "gp2"
}

# Pakistan Configuration
module "vpc_pk" {
  source = "./modules/vpc"
  cidr_block = "10.2.0.0/16"
  public_subnet_cidr = "10.2.1.0/24"
  private_subnet_cidr = "10.2.2.0/24"
}

module "security_group_pk" {
  source = "./modules/security_group"
  vpc_id = module.vpc_pk.vpc_id
}

module "zuul_service_pk" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.zuul
  ami_id            = var.ami_id
  instance_type     = local.instance_types.pakistan.general
  subnet_id         = module.vpc_pk.public_subnet_id
  security_groups   = [module.security_group_pk.web_sg_id]
  instance_name     = "Zuul Service PK"
  country           = "Pakistan"
  volume_size       = 20
  volume_type       = "gp2"
}

module "eureka_service_pk" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.eureka
  ami_id            = var.ami_id
  instance_type     = local.instance_types.pakistan.general
  subnet_id         = module.vpc_pk.public_subnet_id
  security_groups   = [module.security_group_pk.web_sg_id]
  instance_name     = "Eureka Service PK"
  country           = "Pakistan"
  volume_size       = 20
  volume_type       = "gp2"
}

module "auth_service_pk" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.auth
  ami_id            = var.ami_id
  instance_type     = local.instance_types.pakistan.general
  subnet_id         = module.vpc_pk.private_subnet_id
  security_groups   = [module.security_group_pk.app_sg_id]
  instance_name     = "Auth Service PK"
  country           = "Pakistan"
  volume_size       = 20
  volume_type       = "gp2"
}

module "product_service_pk" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.product
  ami_id            = var.ami_id
  instance_type     = local.instance_types.pakistan.general
  subnet_id         = module.vpc_pk.private_subnet_id
  security_groups   = [module.security_group_pk.app_sg_id]
  instance_name     = "Product Service PK"
  country           = "Pakistan"
  volume_size       = 20
  volume_type       = "gp2"
}

module "order_service_pk" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.order
  ami_id            = var.ami_id
  instance_type     = local.instance_types.pakistan.high_mem
  subnet_id         = module.vpc_pk.private_subnet_id
  security_groups   = [module.security_group_pk.app_sg_id]
  instance_name     = "Order Service PK"
  country           = "Pakistan"
  volume_size       = 20
  volume_type       = "gp2"
}

module "user_service_pk" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.user
  ami_id            = var.ami_id
  instance_type     = local.instance_types.pakistan.high_mem
  subnet_id         = module.vpc_in.private_subnet_id
  security_groups   = [module.security_group_in.app_sg_id]
  instance_name     = "User Service IN"
  country           = "India"
  volume_size       = 20
  volume_type       = "gp2"
}

# philippines Configuration
module "vpc_phi" {
  source = "./modules/vpc"
  cidr_block = "10.3.0.0/16"
  public_subnet_cidr = "10.3.1.0/24"
  private_subnet_cidr = "10.3.2.0/24"
}

module "security_group_phi" {
  source = "./modules/security_group"
  vpc_id = module.vpc_phi.vpc_id
}

module "zuul_service_phi" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.zuul
  ami_id            = var.ami_id
  instance_type     = local.instance_types.philippines.general
  subnet_id         = module.vpc_phi.public_subnet_id
  security_groups   = [module.security_group_phi.web_sg_id]
  instance_name     = "Zuul Service Phi"
  country           = "philippines"
  volume_size       = 20
  volume_type       = "gp2"
}

module "eureka_service_phi" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.eureka
  ami_id            = var.ami_id
  instance_type     = local.instance_types.philippines.general
  subnet_id         = module.vpc_phi.public_subnet_id
  security_groups   = [module.security_group_phi.web_sg_id]
  instance_name     = "Eureka Service Phi"
  country           = "philippines"
  volume_size       = 20
  volume_type       = "gp2"
}

module "auth_service_phi" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.auth
  ami_id            = var.ami_id
  instance_type     = local.instance_types.philippines.general
  subnet_id         = module.vpc_phi.private_subnet_id
  security_groups   = [module.security_group_phi.app_sg_id]
  instance_name     = "Auth Service phi"
  country           = "philippines"
  volume_size       = 20
  volume_type       = "gp2"
}

module "product_service_phi" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.product
  ami_id            = var.ami_id
  instance_type     = local.instance_types.philippines.general
  subnet_id         = module.vpc_pk.private_subnet_id
  security_groups   = [module.security_group_pk.app_sg_id]
  instance_name     = "Product Service PK"
  country           = "Pakistan"
  volume_size       = 20
  volume_type       = "gp2"
}

module "order_service_phi" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.order
  ami_id            = var.ami_id
  instance_type     = local.instance_types.philippines.high_mem
  subnet_id         = module.vpc_pk.private_subnet_id
  security_groups   = [module.security_group_pk.app_sg_id]
  instance_name     = "Order Service PK"
  country           = "philippines"
  volume_size       = 20
  volume_type       = "gp2"
}

module "user_service_phi" {
  source            = "./modules/ec2_instance"
  instance_count    = local.instance_counts.user
  ami_id            = var.ami_id
  instance_type     = local.instance_types.philippines
  subnet_id         = module.vpc_in.private_subnet_id
  security_groups   = [module.security_group_in.app_sg_id]
  instance_name     = "User Service IN"
  country           = "philippines"
  volume_size       = 20
  volume_type       = "gp2"
}