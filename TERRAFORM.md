
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| state_bucket_name | Terraform bucket name | string |  | yes |
| create_log_bucket | Boolean flag to decide whether to create log bucket or not | bool | `true` | no |
| versioning_config | Terraform bucket versioning config | object | `null` | no |
| logging_config | Terraform bucket logging config | object | `null` | no |
| force_destroy | Boolean flag to prevent force destroy buckets | bool | `false` | no |
| lock_table_name | Terraform lock table name | string | `""` | no |
| lock_table_read_capacity | Terraform lock table read capacity | string | `1` | no |
| lock_table_write_capacity | Terraform lock table write capacity | string | `1` | no |
| lock_table_hash_key | Terraform lock table hash key | string | `LockID` | no |
| tags | Tags to apply to S3 bucket and optionally to log table | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| tf_state_bucket | Terraform state bucket object |
| tf_log_bucket | Terraform log bucket object |
| tf_lock_table | Terraform lock table object |
