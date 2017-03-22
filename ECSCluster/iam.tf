# An IAM instance profile we attach to the EC2 instances in the cluster
resource "aws_iam_instance_profile" "ecs_instance" {
  name = "${var.iam-name-prefix}instance"
  roles = ["${aws_iam_role.ecs_instance.name}"]

  lifecycle { create_before_destroy = true }
}

# An IAM role that we attach to the EC2 Instances in the cluster
resource "aws_iam_role" "ecs_instance" {
  name = "${var.iam-name-prefix}instance"
  assume_role_policy = "${file("${path.module}/policies/ecs-instance.json")}"

  lifecycle { create_before_destroy = true }
}

# IAM policy we add to aws_iam_role.sigmoid_ecs_instance that allows an ECS Agent running
# on the EC2 Instance to communicate with the Sigmoid ECS cluster
resource "aws_iam_role_policy" "ecs_instance_policy" {
  name = "${var.iam-name-prefix}instance-policy"
  role = "${aws_iam_role.ecs_instance.id}"
  policy = "${file("${path.module}/policies/ecs-instance-policy.json")}"

  lifecycle { create_before_destroy = true }
}

# An IAM Role that we attach to each task
# See the aws_iam_role_policy below to see what permissions this role has
resource "aws_iam_role" "ecs_task" {
  name = "${var.iam-name-prefix}task"
  assume_role_policy = "${file("${path.module}/policies/ecs-task.json")}"
}

# IAM Policy that allows an ECS Service to communicate with EC2 Instances
resource "aws_iam_role_policy" "ecs_task_policy" {
  name = "${var.iam-name-prefix}task-policy"
  role = "${aws_iam_role.ecs_task.id}"
  policy = "${file("${path.module}/policies/ecs-task-policy.json")}"
}