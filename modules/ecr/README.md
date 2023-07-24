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
| Ecr | ECR module | Yes |
| [repository_name1](variables.tf) | ECR repository name 1 | Yes |
| [repository_name2](variables.tf) | ECR repository name 2 | Yes |