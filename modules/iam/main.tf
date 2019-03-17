resource "aws_iam_role" "honeycomb_logs_role" {
  name = "honeycomb-${var.integration_type}-logs-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "honeycomb_lambda_log_policy" {
  name = "honeycomb-${var.integration_type}-lambda-logs-policy"
  role = "${aws_iam_role.honeycomb_logs_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:logs:*:*:*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "honeycomb_lambda_kms_policy" {
  name = "honeycomb-${var.integration_type}-lambda-kms-policy"
  role = "${aws_iam_role.honeycomb_logs_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "kms:Decrypt",
      "Effect": "Allow",
      "Resource": "arn:aws:kms:*:*:key/${var.kms_key_id}"
    }
  ]
}
EOF
}
