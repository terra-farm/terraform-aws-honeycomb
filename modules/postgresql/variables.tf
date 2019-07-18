variable "project" {
  description = "Name of the project."
}

variable "environment" {
  description = "Name of the environment."
}

variable "rds_id" {
  description = "RDS instance identifier. The logs from this RDS instance will be sent to Honeycomb."
}

variable "lambda_version" {
  description = "Version of the Honeycomb.io agentless Lambda function(s) to deploy. See [here](https://github.com/honeycombio/agentless-integrations-for-aws/releases) for the available versions."
  default     = "LATEST"
}

variable "dataset" {
  description = "Name of the destination dataset at Honeycomb.io"
}

variable "honeycomb_write_key" {
  description = "Encrypted version of the Honeycomb write key."
}

variable "kms_key_id" {
  description = "ID of the AWS KMS key used to encrypt the Honeycomb write key."
}
