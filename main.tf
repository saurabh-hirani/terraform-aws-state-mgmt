locals {
  state_bucket_tags = {
    "Name" : "${lower(var.state_bucket_name)}"
  }
  log_bucket_tags = {
    "Name" : var.logging_config != null ? "${lower(var.logging_config.target_bucket)}" : ""
  }
  lock_table_tags = {
    "Name" : var.lock_table_name
  }
}

resource "aws_s3_bucket" "tf_log_bucket" {
  count         = var.create_log_bucket == true && var.logging_config != null ? 1 : 0
  bucket        = local.log_bucket_tags["Name"]
  acl           = "log-delivery-write"
  force_destroy = var.force_destroy
  tags          = merge(local.log_bucket_tags, var.tags)
}

resource "aws_s3_bucket_object" "tf_log_bucket_item" {
  count  = var.create_log_bucket == true && var.logging_config != null ? 1 : 0
  bucket = aws_s3_bucket.tf_log_bucket.0.id
  acl    = "private"
  key    = var.logging_config.target_prefix
  source = "/dev/null"
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket        = local.state_bucket_tags["Name"]
  acl           = "private"
  force_destroy = var.force_destroy

  dynamic "versioning" {
    for_each = var.versioning_config == null ? [] : [var.versioning_config]
    content {
      enabled = versioning.value.enabled
    }
  }

  dynamic "logging" {
    for_each = var.logging_config == null ? [] : [var.logging_config]
    content {
      target_bucket = logging.value.target_bucket
      target_prefix = logging.value.target_prefix
    }
  }

  tags = merge(local.state_bucket_tags, var.tags)
}

resource "aws_dynamodb_table" "tf_lock_table" {
  count          = local.lock_table_tags["Name"] == "" ? 0 : 1
  name           = local.lock_table_tags["Name"]
  hash_key       = var.lock_table_hash_key
  read_capacity  = var.lock_table_read_capacity
  write_capacity = var.lock_table_write_capacity

  attribute {
    name = var.lock_table_hash_key
    type = "S"
  }

  tags = merge(local.lock_table_tags, var.tags)
}
