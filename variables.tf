#General
variable "project_name" {
  default = "XXXXXXXXXX"
}

#VPC
variable "vpc_name" {
  default = "XXXXXXXXXX"
}

#Subnets in security groups
variable "subnet_private_cidr" { #Subnet CIDRs
  type    = list(string)
  default = ["1XXXXXX/XX", "XXXXXX/XX", "XXXXXX/XX"]
}

variable "subnet_isolated_cidr" { #Subnet CIDRs
  type    = list(string)
  default = ["XXXXXX/XX", "XXXXXX/XX", "XXXXXX/XX"]
}

############################################################################

#keyPair
variable "environment" {
  type    = string
  default = "XXXXX"
}

############################################################################

#Bastion
variable "instance_type_bastion" {
  default     = "t3a.micro"
  description = "Instance type bastion"
}

variable "desired_capacity" {
  default     = "1"
  description = "Bastion desired capacity (min - max)"
}