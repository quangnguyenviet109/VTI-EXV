# main.tf
module "code_deploy" {
  source = "../modules/codedeploy"

  deployments = var.deployments
}

module "code_pipeline" {
  source = "../modules/codepipeline"

  pipelines = var.pipelines
}

module "codebuild" {
  source = "../modules/codebuild"

  codebuild_projects = var.codebuild_projects
}


