clusters = {
  cluster_1 = {
    name = "edion-net-dev-app-cluster01"
    container_insights = true
  },
  cluster_2 = {
    name = "edion-net-dev-app-mgt-cluster01"
    container_insights = true
  }
}

services = {
  registration_service = {
    name = "edion-net-app-registration-dev-service"
    cluster_key = "cluster_1"  # References the key in clusters map
    task_definition = "hello-world"
    desired_count = 1
    capacity_provider = "FARGATE"
    capacity_provider_weight = 2
    load_balancer = {
      target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-1:555516925462:targetgroup/edion-net-app-re-dev-tg-blue/4ea223815d859180"
      container_name = "test_cicd"
      container_port = 80
    }
    network_configuration = {
      subnets = ["subnet-69683932"]
      security_groups = ["sg-0a458d7de71051d8f"]
      assign_public_ip = false
    }
  },
  manage_service = {
    name = "edion-net-app-manage-dev-service"
    cluster_key = "cluster_2"  # References the key in clusters map
    task_definition = "hello-world"
    desired_count = 1
    capacity_provider = "FARGATE"
    capacity_provider_weight = 2
    load_balancer = {
      target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-1:555516925462:targetgroup/edion-net-app-ma-dev-tg-blue/b315201cc2552c99"
      container_name = "test_cicd"
      container_port = 80
    }
    network_configuration = {
      subnets = ["subnet-2831df03"]
      security_groups = ["sg-0a458d7de71051d8f"]
      assign_public_ip = false
    }
  }
}