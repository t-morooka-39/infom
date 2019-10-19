resource "aws_ecs_cluster" "sample-ecs-cluster" {
  name = "sample-ecs-cluster"
}

resource "aws_ecs_service" "rails-service" {
  name            = "rails-service"
  cluster         = "${aws_ecs_cluster.sample-ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.sample-task.arn}"
  desired_count   = 1
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = "${aws_lb_target_group.http.arn}"
    container_name   = "sample-rails"
    container_port   = "3000"
  }
}

resource "aws_ecs_task_definition" "sample-task" {
  family                = "rails-service"
  container_definitions = "${file("./jsonfile/service.json")}"
  task_role_arn         = "${data.terraform_remote_state.aws_iam.outputs.ecs_task_role_arn}"
  network_mode          = "bridge"
}

#migration用タスク定義
resource "aws_ecs_task_definition" "rails-migrate" {
  family                = "rails-migrate"
  container_definitions = "${file("./jsonfile/migration.json")}"
  task_role_arn         = "${data.terraform_remote_state.aws_iam.outputs.ecs_task_role_arn}"
  network_mode          = "bridge"
}
resource "aws_cloudwatch_log_group" "sample-service" {
  name = "sample-service"
}
