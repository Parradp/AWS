# Information
 - This module depends on the main modules (datasources.tf / main.tf / variables.tf / provider.tf). Be sure to take the information from the "outside.txt" file and paste it into their respective main files.

## Structure
| Name | Description |
|:------|-------------|
| [datasources.tf](datasources.tf) | Data sources that import the VPC, Subnets and AMIs |
| [main.tf](main.tf) | Building AWS modules |
| [variables.tf](variables.tf) | Writable file for the project |
| [provider.tf](provider.tf) | AWS provider, Terraform state, S3 bucket backend for storing Terraform remote state |

## Modified documents
In the file "variables.tf" you find everything that the variables modify.
| Variable name | Description | Optional |
|:------|-------------|:----:|
| Eks | EKS module |  |
| [dbp_engine_version](variables.tf) | Engine version |  |
| [dbp_username](variables.tf) | Database username |  |
| [dbp_password](variables.tf) | Database password |  |
| [dbp_subnetgroup](variables.tf) | Subnet Group (Create before) |  |
| [dbp_az](variables.tf) | Default availability zone |  |
| [dbp_instance_count](variables.tf) | Number of instances |  |
| [dbp_instance_type](variables.tf) | Type instances |  |