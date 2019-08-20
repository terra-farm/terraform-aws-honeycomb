variable "project" {
  description = "Name of the project."
}

variable "environment" {
  description = "Name of the environment."
}

variable "lambda_version" {
  description = "Version of the Honeycomb.io agentless Lambda function(s) to deploy. See [here](https://github.com/honeycombio/agentless-integrations-for-aws/releases) for the available versions."
  default     = "LATEST"
}

variable "dataset" {
  description = "Catch-all dataset used if upstream events did not include a dataset"
}

variable "honeycomb_write_key" {
  description = "Encrypted version of the Honeycomb write key."
}

variable "kms_key_id" {
  description = "ID of the AWS KMS key used to encrypt the Honeycomb write key."
}

variable "subscription_filters" {
  type        = list(string)
  description = "List of AWS Cloudwatch Log Groups to subscribe to. This will create one subscription filter per group."
}

variable "honeycomb_api_host" {
  default = "https://api.honeycomb.io"
}
