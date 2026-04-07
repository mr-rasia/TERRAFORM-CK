region               = "ap-northeast-1"
environment          = "prod"
project              = "simple-ec2-app"
ssh_key_name         = "your-ssh-key-name"  # Replace with your actual SSH key name
allowed_ssh_cidr     = "your-ip/32"
instance_type        = "t3.small"
vpc_cidr             = "10.1.0.0/16"
public_subnet_cidr   = "10.1.1.0/24"
availability_zone    = "ap-northeast-1a"

tags = {
  Environment = "prod"
  Project     = "simple-ec2-app"
  ManagedBy   = "terraform"
}
