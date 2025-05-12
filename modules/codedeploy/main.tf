data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codedeploy.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "codedeploy_service_role" {
  name               = "CodeDeployServiceRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = aws_iam_role.codedeploy_service_role.name
}

resource "aws_codedeploy_app" "ecs_application" {
  for_each = var.deployments

  name             = each.value.app_name
  compute_platform = "ECS"
}

resource "aws_codedeploy_deployment_group" "ecs_deployment_group" {
  for_each = var.deployments

  app_name               = aws_codedeploy_app.ecs_application[each.key].name
  deployment_group_name  = each.value.deployment_group
  service_role_arn       = aws_iam_role.codedeploy_service_role.arn

  deployment_style {
    deployment_type   = "IN_PLACE"
    deployment_option = "WITH_TRAFFIC_CONTROL"
  }

  ecs_service {
    cluster_name = "Amazon ECS"
    service_name = each.value.service_name
  }

  load_balancer_info {
    elb_info {
      name = each.value.load_balancer_name
    }

    dynamic "target_group_info" {
      for_each = each.value.target_groups
      content {
        name = target_group_info.value
      }
    }
  }

  depends_on = [
    aws_iam_role.codedeploy_service_role
  ]
}
