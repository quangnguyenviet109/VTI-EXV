clusters = {
  cluster_1 = {
    name = "edion-net-dev-app-cluster01"
    container_insights = true
    kms_key = {
      description = "example"
      deletion_window_in_days = 7
      alias = "kms_key_1"
    }
  },
  cluster_2 = {
    name = "edion-net-dev-app-mgt-cluster01"
    container_insights = true
    kms_key = {
      description = "example"
      deletion_window_in_days = 7
      alias = "kms_key_2"
    }
  }
}

services = {
  registration_service = {
    name = "edion-net-app-registration-dev-service"
    cluster_key = "cluster_1"  # References the key in clusters map
    task_definition = "registration-dev-taskdef"
    desired_count = 1
    capacity_provider = "FARGATE"
    capacity_provider_weight = 2
    load_balancer = {
      elb_name = "dev-edion-isp-private-elb"
      container_name = "container_name_registration"
      container_port = 80
    }
    network_configuration = {
      subnets = ["private_subnet_registration"]
      security_groups = ["edion-net-app-ecs-dev-sg"]
      assign_public_ip = false
    }
  },
  manage_service = {
    name = "edion-net-app-manage-dev-service"
    cluster_key = "cluster_2"  # References the key in clusters map
    task_definition = "manage-dev-taskdef"
    desired_count = 1
    capacity_provider = "FARGATE"
    capacity_provider_weight = 2
    load_balancer = {
      elb_name = "dev-edion-isp-private-elb"
      container_name = "container_name_manage"
      container_port = 80
    }
    network_configuration = {
      subnets = ["private_subnet_manage"]
      security_groups = ["edion-net-app-ecs-dev-sg"]
      assign_public_ip = false
    }
  }
}