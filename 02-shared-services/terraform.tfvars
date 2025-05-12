secure_buckets = {
  important_info = {
    bucket_name = "edion-net-dev-important-info"
    region = "ap-northeast-1"
    object_lock_enabled = false
    server_side_encryption = {
      algorithm = "AES256"
      bucket_key_enabled = true
    }
    versioning_enabled = true
  },
  img_upload = {
    bucket_name = "edion-net-dev-img-upload"
    region = "ap-northeast-1"
    object_lock_enabled = false
    server_side_encryption = {
      algorithm = "AES256"
      bucket_key_enabled = true
    }
    versioning_enabled = true
  }
}

artifact_buckets = {
  codepipeline_bucket_manage = {
    bucket_name = "s3_artifact_manage"
  },
  codepipeline_bucket_registration = {
    bucket_name = "s3_artifact_registration"
  }
}

dynamodb_config = {
  table_name   = "edion-net-app-sessions-dev-table"
  hash_key     = "sessionId"
  billing_mode = "PAY_PER_REQUEST"
}
