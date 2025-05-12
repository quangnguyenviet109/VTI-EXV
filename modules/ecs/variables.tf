variable "clusters" {
  description = "Map of ECS clusters configurations"
  type = map(object({
    name = string
    container_insights = bool
    kms_key = object({
      description = string
      deletion_window_in_days = number
      alias = string
    })
  }))
}

variable "services" {
  description = "Map of ECS services configurations"
  type = map(object({
    name = string
    cluster_key = string  # References a key in the clusters map
    task_definition = string
    desired_count = number
    capacity_provider = string
    capacity_provider_weight = number
    load_balancer = object({
      elb_name = string
      container_name = string
      container_port = number
    })
    network_configuration = object({
      subnets = list(string)
      security_groups = list(string)
      assign_public_ip = bool
    })
  }))
}