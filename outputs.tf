output "app_server_role_arn" {
  value = module.iam.app_server_role_arn
}

output "app_server_instance_profile_name" {
  value = module.iam.app_server_instance_profile_name
}

output "job_processor_role_arn" {
  value = module.iam.job_processor_role_arn
}