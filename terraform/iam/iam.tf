resource "aws_iam_user" "infom-deploy-user" {
  name = "infom-deploy-user"
}

resource "aws_iam_policy" "deploy" {
  name        = "deploy"
  path        = "/"
  description = "deploy policy"
  policy      = "${file("jsonfile/ecr_policy.json")}"
}

resource "aws_iam_user_policy_attachment" "deploy-attach" {
  user       = "${aws_iam_user.infom-deploy-user.name}"
  policy_arn = "${aws_iam_policy.deploy.arn}"
}
