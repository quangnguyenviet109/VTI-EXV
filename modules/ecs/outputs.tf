output "cluster_arns" {
  description = "ARNs of the created ECS clusters"
  value = {
    for k, cluster in aws_ecs_cluster.clusters : k => cluster.arn
  }
}

output "service_arns" {
  description = "ARNs of the created ECS services"
  value = {
    for k, service in aws_ecs_service.services : k => service.id
  }
}

output "kms_key_arns" {
  description = "ARNs of the created KMS keys"
  value = {
    for k, key in aws_kms_key.keys : k => key.arn
  }
}