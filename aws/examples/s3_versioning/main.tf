module "remote_state" {
  source            = "../.."
  force_destroy     = true
  state_bucket_name = "test-state-bucket-1"
  versioning_config = {
    enabled = true
  }
  tags = var.tags
}
