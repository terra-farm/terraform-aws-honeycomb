output "honeycomb_logs_role_arn" {
  description = "ARN of the role assumed by the Honeycomb Lambda function."
  value       = "${aws_iam_role.honeycomb_logs_role.arn}"
}
