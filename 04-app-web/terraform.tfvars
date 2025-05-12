pipelines = {
  registration = {
    pipeline_name = "edion-net-dev-app-codepipeline"
    role_arn    = "arn:aws:codestar-connections:us-east-1:123456789012:connection/guid-string"
    bucket_arn  = "arn:aws:codestar-connections:us-east-1:123456789012:connection/guid-string"
    repo_id      = "edion-net-dev-app-repository"
    branch_name  = "master"
    project_name = "edion-net-dev-app-project01"
    app_name     = "edion-net-dev-app01"
    deploy_group = "edion-net-dev-app-deploy_group01"
    connection_arn = "arn:aws:codestar-connections:us-east-1:123456789012:connection/guid-string"
  },
  manage = {
    pipeline_name = "edion-net-dev-app-mgt-codepipeline"
    role_arn    = "arn:aws:codestar-connections:us-east-1:123456789012:connection/guid-string"
    bucket_arn   = "arn:aws:codestar-connections:us-east-1:123456789012:connection/guid-string"
    repo_id      = "edion-net-dev-app-mgt-repository"
    branch_name  = "master"
    project_name = "edion-net-dev-app-mgt-project01"
    app_name     = "edion-net-dev-app-mgt01"
    deploy_group = "edion-net-dev-app-mgt-deploy_group01"
    connection_arn = "arn:aws:codestar-connections:us-east-1:123456789012:connection/guid-string"
  }
}

deployments = {
  registration = {
    app_name           = "edion-net-dev-app-registration"
    service_name       = "edion-net-app-registration-dev-service"
    deployment_group   = "edion-net-dev-app-deploy_group01"
    load_balancer_name = "dev-edion-isp-private-elb"
    target_groups      = ["edion-net-app-registration-dev-tg", "edion-net-app-manage-dev-tg"]
  },
  manage = {
    app_name           = "edion-net-dev-app-mgt"
    service_name       = "edion-net-app-manage-dev-service"
    deployment_group   = "edion-net-dev-app-mgt-deploy_group01"
    load_balancer_name = "dev-edion-isp-private-elb"
    target_groups      = ["edion-net-app-registration-dev-tg", "edion-net-app-manage-dev-tg"]
  }
}

codebuild_projects = {
  registration = {
    project_name   = "edion-net-dev-app-project01"
    description    = "edion-net-dev-app-project01_codebuild"
    service_role   = "arn:aws:codestar-connections:us-east-1:123456789012:connection/guid-string"
    buildspec      = "build-app.yml"
    repository_url = "https://github.com/edion-net-dev-app-repository"
    connection_arn = "arn:aws:codestar-connections:us-east-1:123456789012:connection/guid-string"
  },
  manage = {
    project_name   = "edion-net-dev-app-mgt-project01"
    description    = "edion-net-dev-app-mgt-project01_codebuild"
    service_role   = "arn:aws:codestar-connections:us-east-1:123456789012:connection/guid-string"
    buildspec      = "build-app-mgt.yml"
    repository_url = "https://github.com/edion-net-dev-app-repository"
    connection_arn = "arn:aws:codestar-connections:us-east-1:123456789012:connection/guid-string"
  }
}
