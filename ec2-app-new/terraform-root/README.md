# Root Terraform - Multi-Environment Management

Manage all three environments (dev, qa, prod) from a single Terraform working directory.

## Usage

### Deploy All Environments

```bash
cd /home/anurag-chaurasia/Terraform/ec2-app-new/terraform-root
terraform init
terraform plan
terraform apply
```

### Deploy Only Dev

```bash
cd /home/anurag-chaurasia/Terraform/ec2-app-new/terraform-root
terraform apply -var="deploy_qa=false" -var="deploy_prod=false"
```

### Deploy Only QA

```bash
terraform apply -var="deploy_dev=false" -var="deploy_prod=false"
```

### Deploy Only Prod

```bash
terraform apply -var="deploy_dev=false" -var="deploy_qa=false"
```

### View All Environment URLs

```bash
terraform output all_environments
```

### Destroy All Environments

```bash
terraform destroy
```

### Destroy Only One Environment

```bash
terraform destroy -var="deploy_qa=false" -var="deploy_prod=false"  # destroys only dev
```

## Configuration

Edit `terraform-root/terraform.tfvars` to:

- `ssh_key_name` - your AWS key pair
- `allowed_ssh_cidr` - your IP in CIDR format
- `deploy_dev` - set to false to skip dev
- `deploy_qa` - set to false to skip qa
- `deploy_prod` - set to false to skip prod

## Outputs

After apply, get URLs for all environments:

```bash
terraform output all_environments
```

Or individual environment URLs:

```bash
terraform output dev_website_url
terraform output qa_website_url
terraform output prod_website_url
```

## Regions

- **Dev**: ap-south-1 (Mumbai)
- **QA**: ap-southeast-1 (Singapore)
- **Prod**: ap-northeast-1 (Tokyo)

## State Management

Each module instantiation gets its own state within the root `terraform.tfstate` file. All environments are managed from one place.

## Directory Structure

```
terraform-root/
├── main.tf              (module instantiations for dev, qa, prod)
├── providers.tf         (multi-region AWS provider setup)
├── variables.tf         (root variables)
├── outputs.tf           (root outputs)
└── terraform.tfvars     (configuration)

modules/
├── environment/         (complete environment stack)
├── vpc/
├── security_group/
└── ec2/

app/                     (shared app files)
scripts/                 (shared scripts)
```
