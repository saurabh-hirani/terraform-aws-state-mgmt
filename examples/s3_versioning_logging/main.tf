// Create a new logging bucket - required to simulate scenario where you want to
// reuse an existing logging bucket for your state bucket
resource "aws_s3_bucket" "tf_log_bucket" {
  bucket        = "test-state-log-bucket"
  acl           = "log-delivery-write"
  force_destroy = true
  tags          = var.tags
}

// Enable logging for an existing logging bucket
module "remote_state_w_existing_logging_bucket" {
  source = "../.."

  state_bucket_name = "test-state-bucket-1"
  force_destroy     = true

  versioning_config = {
    enabled = true
  }

  create_log_bucket = false
  logging_config = {
    target_bucket = aws_s3_bucket.tf_log_bucket.id
    target_prefix = "test-state-bucket-1/"
  }

  tags = var.tags
}

// Enable logging with a new logging bucket
module "remote_state_w_new_logging_bucket" {
  source = "../.."

  state_bucket_name = "test-state-bucket-2"
  force_destroy     = true

  versioning_config = {
    enabled = true
  }

  create_log_bucket = true
  logging_config = {
    target_bucket = "test-state-new-log-bucket"
    target_prefix = "test-state-bucket-2/"
  }

  tags = var.tags
}
