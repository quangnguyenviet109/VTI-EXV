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
    priority     = number
    target_group_key = string  # References a key in the target_groups map
    condition = object({
      host_header = list(string)
    })
  }))
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "ingress_rules" {
  description = "Map of ingress rules"
  type = map(object({
    name        = string
    protocol    = string
    from_port   = number
    to_port     = number
    security_groups  = list(string)
  }))
}

variable "egress_rules" {
  description = "Egress rule for the security group"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-northeast-1"
}

