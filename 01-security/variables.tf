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
  description = "Map of listener configurations"
  type = map(object({
    elb_arn        = string
    protocol       = string
    port           = number
    default_action = object({
      type                  = string
      default_target_groups = list(string)
    })
  }))
}


variable "listener_rules" {
  description = "Listener rules with dynamic forward target groups"
  type = map(object({
    priority     = number
    listener_key = string
    condition = object({
      host_header = list(string)
    })
    forward_targets = list(object({
      target_group_key = string
      weight           = number
    }))
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

