variable "project" {
  description = "Name of the project."
}

variable "environment" {
  description = "Name of the environment."
}

variable "integration_type" {
  description = "Type of integration (e.g. 'postgresql', used in the naming of the Terraform resources)"
}

variable "kms_key_id" {
  description = "ID of the AWS KMS key used to encrypt the Honeycomb write key."
}
