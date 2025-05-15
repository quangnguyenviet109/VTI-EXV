pipelines = {
  registration = {
    pipeline_name = "edion-net-dev-app-codepipeline"
    role_arn    = "arn:aws:iam::555516925462:role/service-role/AWSCodePipelineServiceRole-ap-northeast-1-testcicd"
    bucket_arn  = "s3-artifact-registration"
    repo_id      = "quangnguyenviet109/VTI-EXV"
    branch_name  = "main"
    project_name = "edion-net-dev-app-project01"
    app_name     = "edion-net-dev-app01"
    deploy_group = "edion-net-dev-app-deploy_group01"
    connection_arn = "arn:aws:codeconnections:ap-northeast-1:555516925462:connection/19cefa9b-7398-4768-8d99-f43e4fb6b9bf"
  },
  manage = {
    pipeline_name = "edion-net-dev-app-mgt-codepipeline"
    role_arn    = "arn:aws:iam::555516925462:role/service-role/AWSCodePipelineServiceRole-ap-northeast-1-testcicd"
    bucket_arn   = "s3-artifact-manage"
    repo_id      = "quangnguyenviet109/VTI-EXV"
    branch_name  = "main"
    project_name = "edion-net-dev-app-mgt-project01"
    app_name     = "edion-net-dev-app-mgt01"
    deploy_group = "edion-net-dev-app-mgt-deploy_group01"
    connection_arn = "arn:aws:codeconnections:ap-northeast-1:555516925462:connection/19cefa9b-7398-4768-8d99-f43e4fb6b9bf"
  }
}

deployments = {
  registration = {
    app_name           = "edion-net-dev-app01"
    cluster_name       = "edion-net-dev-app-cluster01"
    service_name       = "edion-net-app-registration-dev-service"
    deployment_group   = "edion-net-dev-app-deploy_group01"
    listener_arn = ["arn:aws:elasticloadbalancing:ap-northeast-1:555516925462:listener/app/testedion/d73802ce28753a3e/c7c85dbae3b0e879"]
    target_group_1 = "edion-net-app-manage-dev-tg"
    target_group_2 = "edion-net-app-registration-dev-tg"
  },
  manage = {
    app_name           = "edion-net-dev-app-mgt01"
    cluster_name       = "edion-net-dev-app-mgt-cluster01"
    service_name       = "edion-net-app-manage-dev-service"
    deployment_group   = "edion-net-dev-app-mgt-deploy_group01"
    listener_arn = ["arn:aws:elasticloadbalancing:ap-northeast-1:555516925462:listener/app/testedion/d73802ce28753a3e/c7c85dbae3b0e879"]
    target_group_1 = "edion-net-app-manage-dev-tg"
    target_group_2 = "edion-net-app-registration-dev-tg"
  }
}

codebuild_projects = {
  registration = {
    project_name   = "edion-net-dev-app-project01"
    description    = "edion-net-dev-app-project01_codebuild"
    service_role   = "arn:aws:iam::555516925462:role/service-role/codebuild-cicd_test-service-role"
    buildspec      = "build-app.yml"
    repository_url = "https://github.com/quangnguyenviet109/VTI-EXV#main"
    connection_arn = "arn:aws:codeconnections:ap-northeast-1:555516925462:connection/19cefa9b-7398-4768-8d99-f43e4fb6b9bf"
  },
  manage = {
    project_name   = "edion-net-dev-app-mgt-project01"
    description    = "edion-net-dev-app-mgt-project01_codebuild"
    service_role   = "arn:aws:iam::555516925462:role/service-role/codebuild-cicd_test-service-role"
    buildspec      = "build-app-mgt.yml"
    repository_url = "https://github.com/quangnguyenviet109/VTI-EXV#main"
    connection_arn = "arn:aws:codeconnections:ap-northeast-1:555516925462:connection/19cefa9b-7398-4768-8d99-f43e4fb6b9bf"
  }
}
