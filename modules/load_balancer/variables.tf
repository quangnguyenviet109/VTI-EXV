variable "target_groups" {
  description = "Map of target group configurations"
  type = map(object({
    name        = string
    port        = number
    protocol    = string
    vpc_id      = string
    target_type = string
  }))
}

variable "listener" {
  description = "HTTPS listener configuration"
  type = object({
    elb_arn         = string
    protocol        = string
    port            = number
    certificate_arn = string
    default_action  = object({
      type          = string
      fixed_response = object({
        status_code  = number
        content_type = string
        message_body = string
      })
    })
  })
}

variable "listener_rules" {
  description = "Map of listener rule configurations"
  type = map(object({
    priority        = number
    target_group_key = string  # References a key in the target_groups map
    condition = object({
      host_header = list(string)
    })
  }))
}