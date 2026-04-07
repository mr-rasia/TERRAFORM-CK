output "dev_website_url" {
  description = "Dev environment website URL"
  value       = var.deploy_dev ? "http://${module.dev[0].public_ip}" : null
}

output "qa_website_url" {
  description = "QA environment website URL"
  value       = var.deploy_qa ? "http://${module.qa[0].public_ip}" : null
}

output "prod_website_url" {
  description = "Prod environment website URL"
  value       = var.deploy_prod ? "http://${module.prod[0].public_ip}" : null
}

output "dev_instance_id" {
  description = "Dev EC2 instance ID"
  value       = var.deploy_dev ? module.dev[0].instance_id : null
}

output "qa_instance_id" {
  description = "QA EC2 instance ID"
  value       = var.deploy_qa ? module.qa[0].instance_id : null
}

output "prod_instance_id" {
  description = "Prod EC2 instance ID"
  value       = var.deploy_prod ? module.prod[0].instance_id : null
}

output "all_environments" {
  description = "All environment details"
  value = {
    dev = var.deploy_dev ? {
      url       = "http://${module.dev[0].public_ip}"
      instance_id = module.dev[0].instance_id
      region    = var.dev_region
    } : null
    qa = var.deploy_qa ? {
      url       = "http://${module.qa[0].public_ip}"
      instance_id = module.qa[0].instance_id
      region    = var.qa_region
    } : null
    prod = var.deploy_prod ? {
      url       = "http://${module.prod[0].public_ip}"
      instance_id = module.prod[0].instance_id
      region    = var.prod_region
    } : null
  }
}
