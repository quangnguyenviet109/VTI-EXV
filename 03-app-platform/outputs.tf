output "cluster_arns" {
  description = "ARNs of the created ECS clusters"
  value = module.ecs.cluster_arns
}

output "service_arns" {
  description = "ARNs of the created ECS services"
  value = module.ecs.service_arns
}

output "kms_key_arns" {
  description = "ARNs of the created KMS keys"
  value = module.ecs.kms_key_arns
}