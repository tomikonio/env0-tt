# AWS CloudFront with Dual S3 Origins

This Terraform configuration deploys a CloudFront distribution with two S3 bucket origins.

## Prerequisites

- Terraform >= 1.2.0
- AWS account with appropriate permissions
- AWS regions supported: us-east-1, ap-south-1

## Required Tags

All resources will be automatically tagged with:
- `owner`: DeveleaP email (name.lastname@develeap.com)
- `stage`: production/dev/test
- `project`: Project name
- `start_date`: Project start date (dd/mm/yyyy)
- `end_date`: Project end date (dd/mm/yyyy)

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Update `terraform.tfvars` with your values:
```hcl
aws_region           = "us-east-1"
primary_bucket_name   = "your-primary-bucket"
secondary_bucket_name = "your-secondary-bucket"
owner                = "name.lastname@develeap.com"
stage                = "dev"
project              = "project_name"
start_date           = "01/01/2024"
end_date             = "31/12/2024"
```

3. Apply the configuration:
```bash
terraform plan
terraform apply
```

## Architecture

- Primary S3 bucket serves content from root path (/)
- Secondary S3 bucket serves content from /secondary/*
- CloudFront enforces HTTPS
- S3 buckets are private, accessible only through CloudFront

## Outputs

- `cloudfront_domain_name`: The CloudFront distribution domain
- `cloudfront_distribution_id`: The distribution ID
- `primary_bucket_name`: Name of the primary S3 bucket
- `secondary_bucket_name`: Name of the secondary S3 bucket

```Folder struct
.
├── main.tf          # Main configuration
├── variables.tf     # Input variables
├── outputs.tf       # Output values
├── providers.tf     # Provider configurations
├── terraform.tfvars # Variable values
└── modules/
    ├── s3/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── cloudfront/
        ├── main.tf
        ├── variables.tf
```

    └── outputs.tf
'''
