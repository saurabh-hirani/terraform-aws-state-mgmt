
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| tf_bucket_name | Terraform bucket name | string |  | yes |
| lock_table_name | Terraform lock table name | string | `""` | no |
| versioning_config | Terraform bucket versioning config | object | `null` | no |
| logging_config | Terraform bucket logging config | object | `null` | no |
| force_destroy_state_buckets | Boolean flag to prevent force destroy of state buckets through Terraform console | string | `false` | no |
| lock_table_read_capacity | Terraform lock table read capacity | string | `1` | no |
| lock_table_write_capacity | Terraform lock table write capacity | string | `1` | no |
| lock_table_hash_key | Terraform lock table hash key | string | `LockID` | no |
| tags | Tags to apply to S3 bucket and optionally to log table | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| tf_bucket | Terraform bucket object |
| tf_lock_table | Terraform lock table object |
