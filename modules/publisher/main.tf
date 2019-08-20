module "permissions" {
  source           = "../iam"
  project          = "${var.project}"
  environment      = "${var.environment}"
  integration_type = "publisher"
  kms_key_id       = "${var.kms_key_id}"
}

data "aws_region" "current" {}

resource "aws_lambda_function" "honeycomb_publisher" {
  s3_bucket     = "honeycomb-integrations-${data.aws_region.current.name}"
  s3_key        = "agentless-integrations-for-aws/${var.lambda_version}/ingest-handlers.zip"
  function_name = "honeycomb-publisher-${var.project}-${var.environment}-logs"
  role          = "${module.permissions.honeycomb_logs_role_arn}"
  handler       = "publisher"
  runtime       = "go1.x"
  memory_size   = "128"

  environment {
    variables = {
      API_HOST            = "${var.honeycomb_api_host}"
      HONEYCOMB_WRITE_KEY = "${var.honeycomb_write_key}"
      KMS_KEY_ID          = "${var.kms_key_id}"
      DATASET             = "${var.dataset}"
    }
  }
}

resource "aws_cloudwatch_log_subscription_filter" "subscription_filters" {
  for_each        = toset(var.subscription_filters)
  name            = "honeycomb-publisher-${each.key}"
  log_group_name  = each.key
  filter_pattern  = ""
  destination_arn = "${aws_lambda_function.honeycomb_publisher.arn}"
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.honeycomb_publisher.arn}"
  principal     = "logs.amazonaws.com"
}
