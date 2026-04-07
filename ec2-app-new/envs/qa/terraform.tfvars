region               = "ap-southeast-1"
environment          = "qa"
project              = "simple-ec2-app"
ssh_key_name         = "your-ssh-key-name"  # Replace with your actual SSH key name
allowed_ssh_cidr     = "your-ip/32"
instance_type        = "t3.micro"
vpc_cidr             = "10.2.0.0/16"
public_subnet_cidr   = "10.2.1.0/24"
availability_zone    = "ap-southeast-1a"

tags = {
  Environment = "qa"
  Project     = "simple-ec2-app"
  ManagedBy   = "terraform"
}
