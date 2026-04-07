ssh_key_name      = "your-ssh-key-name"  # Replace with your actual SSH key name
allowed_ssh_cidr  = "your-ip/32"

# Deployment flags - set to false to skip an environment
deploy_dev  = true
deploy_qa   = true
deploy_prod = true

common_tags = {
  Project   = "simple-ec2-app"
  ManagedBy = "terraform"
  CreatedBy = "root-terraform"
}
