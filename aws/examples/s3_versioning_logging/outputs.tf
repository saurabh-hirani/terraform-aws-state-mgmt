output "tf_bucket_id_1" {
  value       = module.remote_state_w_existing_logging_bucket.tf_state_bucket.id
  description = "Terraform bucket ID 1"
}

output "tf_bucket_id_2" {
  value       = module.remote_state_w_new_logging_bucket.tf_state_bucket.id
  description = "Terraform bucket ID 2"
}

output "tf_log_bucket" {
  value       = module.remote_state_w_new_logging_bucket.tf_log_bucket.*.id
  description = "Terraform log bucket ID"
}
