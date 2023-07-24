module "keyPair" {
  source       = "./modules/keyPair"
  environment  = var.environment
  project_name = var.project_name
}

module "securityGroup" {
  source               = "./modules/securityGroup"
  vpc_id               = data.aws_vpc.vpc.id
  subnet_private_cidr  = var.subnet_private_cidr
  subnet_isolated_cidr = var.subnet_isolated_cidr
}

module "asgBastion" {
  source                = "./modules/asgBastion"
  project_name          = var.project_name
  security_group_asg    = module.security-group.bastion_security_group_id
  subnets_asg           = data.aws_subnets.public.ids
  key_account           = module.key-pair.key_pair
  bastion_ami           = data.aws_ami.amazon_2023.id
  instance_type_bastion = var.instance_type_bastion
  desired_capacity      = var.desired_capacity
}