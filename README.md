# TERRAFORM AWS MODULES
This project has four main dependencies "main.tf | datasources.tf | variables.tf | provider.tf" These dependencies can be filled according to your preferences. Each module has a "outside.txt" where you will find the intructions for its use.
Remove or add modules as per your need.

## Structure
The main structure is:
| Name | Description |
|:------|-------------|
| [datasources.tf](datasources.tf) | Data sources that import the VPC, Subnets and AMIs |
| [main.tf](main.tf) | Building AWS modules |
| [variables.tf](variables.tf) | Writable file for the project |
| [provider.tf](provider.tf) | AWS provider, Terraform state, S3 bucket backend for storing Terraform remote state |

#### Important (before initial "terraform apply")
The generated [.tfstate](provider.tf) is not stored in the remote state S3 bucket. Make sure the base [.tfstate](provider.tf) is registered in your infrastructure repository. You will have to modify this if you want to store it.


## Modified documents
In the file "variables.tf" you find everything that the variables modify.
| Variable name | Description | Optional |
|:------|-------------|:----:|
| General | General settings |  |
| [project_name](variables.tf) | Indicates the name of the project |  |
| [vpc_name](variables.tf) | Existing vpc name |  |
| [subnet_private_cidr](variables.tf) | CIDR of existing private subnets |  |
| [subnet_isolated_cidr](variables.tf) | CIDR of existing isolated subnets |  |
| KeyPair | KeyPair module | Yes |
| [environment](variables.tf) | Environment type | Yes |
| Bastion | EC2 instance bastion module | Yes |
| [instance_type_bastion](variables.tf) | Instance type bastion | Yes |
| [desired_capacity](variables.tf) | ASG desired capacity (min - max) | Yes |


## Changes after deploying infrastructure

### EKS Module
#### Configure AuthMap (If admin access is required)
- AWS Login: aws configure
- Install Kubectl: https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html
- aws eks update-kubeconfig --name (EKS_CLUSTER_NAME)
- kubectl -n kube-system edit configmap aws-auth

  mapUsers: |
    - userarn: USER_ARN
    - username: USERNAME
    - groups:
        - system:masters


## About me
https://github.com/sebaswk