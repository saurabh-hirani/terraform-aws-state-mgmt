output "tf_state_bucket" {
  value       = aws_s3_bucket.tf_state_bucket
  description = "Terraform bucket ID"
}

output "tf_log_bucket" {
  value       = aws_s3_bucket.tf_log_bucket
  description = "Terraform log ID"
}

output "tf_lock_table" {
  value       = aws_dynamodb_table.tf_lock_table
  description = "Terraform lock table name"
}
