# Data source for existing load balancer
# Create target groups using for_each
resource "aws_lb_target_group" "target_groups" {
  for_each = var.target_groups
  
  name        = substr(each.value.name, 0, 32) 
  port        = each.value.port
  protocol    = each.value.protocol
  vpc_id      = each.value.vpc_id
  target_type = each.value.target_type
}

# Create HTTPS listener
resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = var.listener.elb_arn
  protocol          = var.listener.protocol
  port              = var.listener.port
  certificate_arn   = var.listener.certificate_arn

  default_action {
    type = var.listener.default_action.type
    
    dynamic "fixed_response" {
      for_each = var.listener.default_action.type == "fixed-response" ? [var.listener.default_action.fixed_response] : []
      
      content {
        status_code  = fixed_response.value.status_code
        content_type = fixed_response.value.content_type
        message_body = fixed_response.value.message_body
      }
    }
  }
}

# Create listener rules using for_each
resource "aws_lb_listener_rule" "listener_rules" {
  for_each = var.listener_rules
  
  listener_arn = aws_lb_listener.https_listener.arn
  priority     = each.value.priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_groups[each.value.target_group_key].arn
  }

  condition {
    host_header {
      values = each.value.condition.host_header
    }
  }
}