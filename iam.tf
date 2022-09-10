resource "aws_iam_role" "this" {
  name               = "${var.system_name}-${var.env}-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_sts.json
}

resource "aws_iam_role_policy" "this" {
  name   = "${var.system_name}-${var.env}-cloudwatch-agent-role"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.wildcard_cloudwatch_agent.json
}

data "aws_iam_policy_document" "ec2_sts" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "wildcard_cloudwatch_agent" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:DescribeTags",
      "cloudwatch:PutMetricData",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
      "logs:DescribeLogGroups",
      "logs:CreateLogStream",
      "logs:CreateLogGroup"
    ]
    resources = ["*"]
  }
}
