target_groups = {
  registration-blue = {
    name        = "edion-net-app-registration-dev-tg-blue"
    port        = 443
    protocol    = "HTTPS"
    vpc_id      = "vpc-5f684d38"
    target_type = "ip"
  },
  registration-green = {
    name        = "edion-net-app-registration-dev-tg-green"
    port        = 443
    protocol    = "HTTPS"
    vpc_id      = "vpc-5f684d38"
    target_type = "ip"
  },
  manage-blue = {
    name        = "edion-net-app-manage-dev-tg-blue"
    port        = 80
    protocol    = "HTTP"
    vpc_id      = "vpc-5f684d38"
    target_type = "ip"
  },
  manage-green = {
    name        = "edion-net-app-manage-dev-tg-green"
    port        = 80
    protocol    = "HTTP"
    vpc_id      = "vpc-5f684d38"
    target_type = "ip"
  }
}

listener = {
  elb_arn         = "arn:aws:elasticloadbalancing:ap-northeast-1:555516925462:loadbalancer/app/testedion/d73802ce28753a3e"
  protocol        = "HTTP"
  port            = 81
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
  registration-blue = {
    priority        = 10
    target_group_key = "registration-blue"  # References the key in target_groups map
    condition = {
      host_header = ["registration.domain"]
    }
  },
  registration-green = {
    priority        = 30
    target_group_key = "registration-green"  # References the key in target_groups map
    condition = {
      host_header = ["registration.domain"]
    }
  },
  manage-blue = {
    priority        = 20
    target_group_key = "manage-blue"  # References the key in target_groups map
    condition = {
      host_header = ["manage.domain"]
    }
  },
  manage-green = {
    priority        = 40
    target_group_key = "manage-green"  # References the key in target_groups map
    condition = {
      host_header = ["manage.domain"]
    }
  }
}

vpc_id    = "vpc-5f684d38"
sg_name = "edion-net-app-ecs-dev-sg"
ingress_rules = {
  db_access = {
    name        = "Database access"
    protocol    = "tcp"
    from_port   = 5432
    to_port     = 5432
    security_groups  = ["sg-024db7526f464db85"]
  },
  https_access = {
    name        = "HTTPS access"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    security_groups  = ["sg-024db7526f464db85"]
  },
  http_access = {
    name        = "HTTP access"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    security_groups  = ["sg-024db7526f464db85"]
  }
}

egress_rules = {
  from_port   = 0
  to_port     = 0
  protocol    = "all"
  cidr_blocks = ["0.0.0.0/0"]
}

