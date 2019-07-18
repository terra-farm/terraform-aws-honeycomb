module "permissions" {
  source           = "../iam"
  project          = "${var.project}"
  environment      = "${var.environment}"
  integration_type = "postgresql"
  kms_key_id       = "${var.kms_key_id}"
}

data "aws_region" "current" {}

resource "aws_lambda_function" "honeycomb_postgresql_rds_logs" {
  s3_bucket     = "honeycomb-integrations-${data.aws_region.current.name}"
  s3_key        = "agentless-integrations-for-aws/${var.lambda_version}/ingest-handlers.zip"
  function_name = "honeycomb-postgresql-${var.project}-${var.environment}-logs"
  role          = "${module.permissions.honeycomb_logs_role_arn}"
  handler       = "postgresql-handler"
  runtime       = "go1.x"
  memory_size   = "128"

  environment {
    variables = {
      ENVIRONMENT         = "${var.environment}"
      HONEYCOMB_WRITE_KEY = "${var.honeycomb_write_key}"
      KMS_KEY_ID          = "${var.kms_key_id}"
      DATASET             = "${var.dataset}"
      SAMPLE_RATE         = "1"
      SCRUB_QUERY         = "false"
    }
  }
}

resource "aws_cloudwatch_log_subscription_filter" "honeycomb_postgresql_rds_lambdafunction_logfilter" {
  name            = "honeycomb-postgresql-rds-subscription"
  log_group_name  = "/aws/rds/instance/${var.rds_id}/postgresql"
  filter_pattern  = ""
  destination_arn = "${aws_lambda_function.honeycomb_postgresql_rds_logs.arn}"
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.honeycomb_postgresql_rds_logs.arn}"
  principal     = "logs.amazonaws.com"
}
