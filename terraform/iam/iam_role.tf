resource "aws_iam_role" "ecs_instance_role" {
  name               = "ecs_instance_role"
  path               = "/"
  assume_role_policy = "${file("jsonfile/ec2_assume_role_policy.json")}"
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecs-instance-profile"
  role = "${aws_iam_role.ecs_instance_role.name}"
}

#ecstask role
resource "aws_iam_role" "ecs_task_role" {
  name               = "ecs-task-role"
  path               = "/"
  assume_role_policy = "${file("jsonfile/ecs_task_assume_role_policy.json")}"
}
#policy
resource "aws_iam_policy" "ecs_instance_policy" {
  name        = "ecs-instance-policy"
  path        = "/"
  description = ""
  policy      = "${file("jsonfile/ecs_instance_policy.json")}"
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role_attach" {
  role       = "${aws_iam_role.ecs_instance_role.name}"
  policy_arn = "${aws_iam_policy.ecs_instance_policy.arn}"
}
