# AWS EC2 and Load Balancer - env0 Lab

This Terraform configuration demonstrates the deployment of an EC2 instance with an Application Load Balancer using env0 as the deployment platform. This lab is part of the Develeap training program.

## Architecture Overview

The infrastructure consists of three main components:

1. **Networking Module**
   - Custom VPC with public subnets
   - Internet Gateway for public access
   - Route tables and network ACLs

2. **Compute Module**
   - EC2 instance in a public subnet
   - Security group for instance access
   - Instance profile and IAM roles

3. **Load Balancer Module**
   - Application Load Balancer (ALB)
   - Target group configuration
   - Security group for ALB access

## Prerequisites

- An env0 account with appropriate permissions
- Basic understanding of AWS EC2 and Load Balancing
- Supported AWS regions: us-east-1

## Required Tags

The following tags MUST be applied to all resources to comply with AWS policies:

### Mandatory AWS Tags
- `Objective`: Must be set to "true"
- `Expiration`: Must be set to "true"
- `Email`: Must be set to "true"

### Project Tags
- `owner`: Your email address
- `stage`: Environment stage (production/dev/test)
- `project`: Project identifier

Failure to include these tags will result in deployment failures due to AWS IAM policies.

## Configuration

Update your `terraform.tfvars` with appropriate values:

```hcl
vpc_cidr      = "10.0.0.0/16"
project       = "your-project-name"
instance_type = "t3.micro"
owner         = "your.name@develeap.com"
stage         = "dev"

# Required AWS tags
tags = {
  Objective  = "true"
  Expiration = "true"
  Email      = "true"
}
```

## Deployment Steps

1. In env0, create a new template pointing to this repository
2. Configure the required AWS credentials in env0
3. Set the necessary variables in your env0 template
4. Ensure all required tags are configured
5. Deploy the environment through env0's UI

## Project Structure

```
.
├── main.tf          # Main configuration
├── variables.tf     # Input variables
├── outputs.tf       # Output values
├── providers.tf     # Provider configurations
├── terraform.tfvars # Variable values
└── modules/
    ├── networking/  # VPC and subnet configurations
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── compute/    # EC2 instance configurations
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── loadbalancer/# ALB configurations
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Outputs

After successful deployment, you'll have access to:
- `alb_dns_name`: The DNS name of the Application Load Balancer
- `instance_id`: The ID of the deployed EC2 instance
- `vpc_id`: The ID of the created VPC
- `public_subnet_ids`: List of public subnet IDs

## DVLP CI Tools

This repository implements strict code quality standards and commit message conventions using Husky and commitlint.

### Installation

To set up the project dependencies:
```bash
make install
```

### Commit Message Convention

Follow the Conventional Commits specification:

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

#### Commit Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code styling changes
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding/updating tests
- `build`: Build process changes
- `ci`: CI configuration changes
- `chore`: Other changes
- `revert`: Reverting commits

#### Required Components
- **Type**: Indicates commit purpose (required)
- **Scope**: Affected component/module (required)
- **Description**: Brief change summary (required)
- **Body**: Detailed explanation (optional)
- **Footer**: References/breaking changes (optional)

#### Example Commits
```
feat(networking): add custom VPC configuration
fix(compute): resolve instance startup issue
docs(readme): update deployment instructions
```

## Support

For any issues or questions, please contact:
- Develeap Support Team

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_compute"></a> [compute](#module\_compute) | ./modules/compute | n/a |
| <a name="module_loadbalancer"></a> [loadbalancer](#module\_loadbalancer) | ./modules/loadbalancer | n/a |
| <a name="module_networking"></a> [networking](#module\_networking) | ./modules/networking | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region for the resources | `string` | `"us-east-1"` | no |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | Default root object for the CloudFront distribution | `string` | `"index.html"` | no |
| <a name="input_end_date"></a> [end\_date](#input\_end\_date) | Project end date (dd/mm/yyyy) | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t3.micro"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner's develeap email (name.lastname@develeap.com) | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name (must be descriptive) | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | Environment stage (production, dev, or test) | `string` | n/a | yes |
| <a name="input_start_date"></a> [start\_date](#input\_start\_date) | Project start date (dd/mm/yyyy) | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for VPC | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | DNS name of the ALB |
| <a name="output_instance_public_ip"></a> [instance\_public\_ip](#output\_instance\_public\_ip) | Public IP of the EC2 instance |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC |


## License

Copyright © 2024 Develeap. All rights reserved.

