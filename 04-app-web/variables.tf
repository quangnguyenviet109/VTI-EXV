variable "pipelines" {
  description = "A map of pipeline configurations"
  type = map(object({
    pipeline_name  = string
    role_arn      = string
    bucket_arn   = string
    repo_id        = string
    branch_name    = string
    project_name   = string
    app_name       = string
    deploy_group   = string
    connection_arn = string
  }))
}

variable "deployments" {
  description = "Map of deployment configurations"
  type = map(object({
    app_name           = string
    service_name       = string
    deployment_group   = string
    load_balancer_name = string
    target_groups      = list(string)
  }))
}

variable "codebuild_projects" {
  description = "A map of CodeBuild project configurations"
  type = map(object({
    project_name    = string
    description     = string
    service_role    = string
    buildspec       = string
    repository_url  = string
    connection_arn  = string
  }))
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-northeast-1"
}

variable "access_key" {
  description = "access console aws console"
}

variable "secret_key" {
  description = "Secret console key to aws"
}

