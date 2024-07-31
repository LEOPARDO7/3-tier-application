module "vpc"{
source = "./vpc"

vpc_cidr = "10.0.0.0/16"
pub_sub1 = "10.0.0.0/28"
pub_sub2 = "10.0.0.16/28"
pvt_sub1 = "10.0.0.32/28"
pvt_sub2 = "10.0.0.48/28"
pvt_sub3 = "10.0.0.64/28"
pvt_sub4 = "10.0.0.80/28"
}

module "ec2"{
source = "./ec2"

ami_id = "ami-0427090fd1714168b"
instance_type = "t2.micro"
key_name = "demo"
vpc_zone_id = [module.vpc.public_subnet1,module.vpc.public_subnet2]
}

module "alb" {
source = "./alb"

vpc_id = module.vpc.vpc_id
autoscaling_group_name = module.ec2.three_tier_web_asg_name
public_subnets = [module.vpc.public_subnet1,module.vpc.public_subnet2]
}

module "rds" {
source = "./rds"

private_subnets = [module.vpc.private_subnet1,module.vpc.private_subnet2]
database_password = "databaseadmin"
security_group = ["sg-015173ef8bc5d125d"]
}
