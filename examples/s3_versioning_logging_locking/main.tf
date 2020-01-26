module "remote_state" {
  source = "../.."

  state_bucket_name = "test-state-bucket-1"
  force_destroy     = true

  versioning_config = {
    enabled = true
  }

  create_log_bucket = true
  logging_config = {
    target_bucket = "test-state-log-bucket-1"
    target_prefix = "logs/"
  }

  lock_table_name = "test-state-lock-table-1"

  tags = var.tags
}
