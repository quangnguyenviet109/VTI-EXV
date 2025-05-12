module "s3" {
  source = "../modules/s3"
  
  secure_buckets = var.secure_buckets
  artifact_buckets = var.artifact_buckets
}
module "dynamodb" {
  source = "../modules/dynamodb"
  
  dynamodb_config = var.dynamodb_config
}
