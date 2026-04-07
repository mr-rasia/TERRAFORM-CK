region               = "ap-south-1"
environment          = "dev"
project              = "simple-ec2-app"
ssh_key_name         = "your-ssh-key-name"  # Replace with your actual SSH key name
allowed_ssh_cidr     = "your-ip/32"
instance_type        = "t3.micro"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
availability_zone    = "ap-south-1a"

tags = {
  Environment = "dev"
  Project     = "simple-ec2-app"
  ManagedBy   = "terraform"
}
