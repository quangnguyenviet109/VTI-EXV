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
    elb_arn        = string
    protocol       = string
    port           = number
    default_action = object({
      type                    = string
      default_target_groups   = list(string)  # danh sách key của target groups
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