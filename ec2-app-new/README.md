# EC2 App - Namespace Structure

This folder deploys EC2 instances across multiple environments using a modular Terraform structure with a clean namespace organization.

## Directory Structure

```
ec2-app-new/
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── security_group/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── envs/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── terraform.tfvars
│   ├── qa/
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── main.tf
│       ├── providers.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── terraform.tfvars
├── app/
│   ├── index.html
│   └── app.py
└── scripts/
    └── user_data.sh.tpl
```

## How to Deploy

### Deploy to Dev (ap-south-1)

```bash
cd envs/dev
terraform init
terraform plan
terraform apply
```

Get the URL:
```bash
terraform output website_url
```

### Deploy to QA (ap-southeast-1)

```bash
cd ../qa
terraform init
terraform plan
terraform apply
```

### Deploy to Prod (ap-northeast-1)

```bash
cd ../prod
terraform init
terraform plan
terraform apply
```

### Deploy All Environments

From the root `ec2-app-new/` folder:

```bash
for env in dev qa prod; do
  cd envs/$env
  terraform apply -auto-approve
  cd ../..
done
```

## Environment Details

| Environment | Region | Availability Zone | Instance Type | VPC CIDR | Purpose |
|---|---|---|---|---|---|
| Dev | ap-south-1 | ap-south-1a | t3.micro | 10.0.0.0/16 | Development |
| QA | ap-southeast-1 | ap-southeast-1a | t3.micro | 10.2.0.0/16 | Testing |
| Prod | ap-northeast-1 | ap-northeast-1a | t3.small | 10.1.0.0/16 | Production |

## Modules

### VPC Module (`modules/vpc/`)
- Creates VPC with CIDR block
- Creates public subnet
- Creates Internet Gateway
- Creates and associates public route table

### Security Group Module (`modules/security_group/`)
- Creates security group
- Allows SSH (port 22) from specified CIDR
- Allows HTTP (port 80) from anywhere
- Allows all outbound traffic

### EC2 Module (`modules/ec2/`)
- Finds latest Amazon Linux 2 AMI
- Launches EC2 instance
- Assigns public IP
- Runs user data script

## Environment-Specific Configuration

Each environment folder has:

- `terraform.tfvars` - configuration values
- `main.tf` - module calls
- `providers.tf` - AWS provider setup
- `variables.tf` - variable definitions
- `outputs.tf` - output definitions

Edit `terraform.tfvars` in each environment to customize:
- `ssh_key_name`
- `allowed_ssh_cidr`
- `instance_type`
- Other networking settings

## Cleanup

Destroy Dev:
```bash
cd envs/dev
terraform destroy -auto-approve
```

Destroy All:
```bash
for env in dev qa prod; do
  cd envs/$env
  terraform destroy -auto-approve
  cd ../..
done
```

## Notes

- Each environment has its own `terraform.tfstate` file
- Modules are shared across all environments
- App files (`app/` and `scripts/`) are shared
- Each environment deploys in a different AWS region for isolation
