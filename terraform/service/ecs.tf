resource "aws_ecs_cluster" "sample-ecs-cluster" {
  name = "sample-ecs-cluster"
}

resource "aws_ecs_service" "rails-service" {
  name            = "rails-service"
  cluster         = "${aws_ecs_cluster.sample-ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.sample-task.arn}"
  desired_count   = 1
  launch_type     = "EC2"
}

resource "aws_ecs_task_definition" "sample-task" {
  family                = "rails-service"
  container_definitions = "${file("./jsonfile/service.json")}"
  task_role_arn         = "${data.terraform_remote_state.aws_iam.outputs.ecs_task_role_arn}"
  network_mode          = "bridge"
}
resource "aws_cloudwatch_log_group" "sample-service" {
  name = "sample-service"
}
