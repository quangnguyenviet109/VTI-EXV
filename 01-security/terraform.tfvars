existing_lb_name = "dev-edion-isp-private-elb"

target_groups = {
  registration = {
    name        = "edion-net-app-registration-dev-tg"
    port        = 443
    protocol    = "HTTPS"
    vpc_id      = "dev-edion-isp"
    target_type = "ip"
  },
  manage = {
    name        = "edion-net-app-manage-dev-tg"
    port        = 443
    protocol    = "HTTPS"
    vpc_id      = "dev-edion-isp"
    target_type = "ip"
  }
}

listener = {
  elb_arn         = "arn:aws:acm:us-east-1:123456789012:certificate/example"
  protocol        = "HTTPS"
  port            = 443
  certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/example"
  default_action  = {
    type          = "fixed-response"
    fixed_response = {
      status_code  = 200
      content_type = "text/plain"
      message_body = "OK"
    }
  }
}

listener_rules = {
  registration = {
    priority        = 10
    target_group_key = "registration"  # References the key in target_groups map
    condition = {
      host_header = ["registration.domain"]
    }
  },
  manage = {
    priority        = 20
    target_group_key = "manage"  # References the key in target_groups map
    condition = {
      host_header = ["manage.domain"]
    }
  }
}

vpc_id    = "dev-edion_isp"
alb_sg_id = "edion-net-app-alb-dev-sg"
sg_name = "edion-net-app-ecs-dev-sg"
ingress_rules = {
  db_access = {
    name        = "Database access"
    protocol    = "tcp"
    from_port   = 5432
    to_port     = 5432
    cidr_blocks = ["0.0.0.0/0"]
  },
  https_access = {
    name        = "HTTPS access"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  },
  http_access = {
    name        = "HTTP access"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
}

egress_rules = {
  from_port   = 0
  to_port     = 0
  protocol    = "all"
  cidr_blocks = ["0.0.0.0/0"]
}

