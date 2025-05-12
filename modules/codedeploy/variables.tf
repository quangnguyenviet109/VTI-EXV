variable "deployments" {
  description = "A map of deployment configurations"
  type = map(object({
    app_name           = string
    service_name       = string
    deployment_group   = string
    load_balancer_name = string
    target_groups      = list(string)
  }))
}
