# Honeycomb agentless integration for PostgreSQL RDS logs.

This repo contains a set of modules in the [modules folder](https://github.com/terra-farm/terraform-aws-honeycomb/tree/master/modules) 
for deploying the [agentless AWS integrations](https://github.com/honeycombio/agentless-integrations-for-aws) 
for [Honeycomb.io](https://honeycomb.io).

These are production ready versions of the [terraform](https://github.com/honeycombio/agentless-integrations-for-aws/tree/master/terraform) 
examples in the Honeycomb Git repository.

## How to use this Module

Example:

```hcl
module "postgresql_production_logs" {
  source              = "terra-farm/honeycomb/aws//modules/postgresql"
  version             = "0.0.1"
  project             = "your-application-project-name"
  environment         = "production"
  rds_id              = "your-production-postgresql-rds-id"
  dataset             = "your-dataset-name-on-honeycomb"
  lambda_version      = "1.6.0"
  honeycomb_write_key = "CiphertextBlob-of-your-KMS-encrypted-honeycomb-write-key"
  kms_key_id          = "kms-key-id-used-to-encrypt-the-write-key"
}
```


## How do I contribute to this Module?

Contributions are very welcome! Check out the [Contribution Guidelines](https://github.com/terra-farm/terraform-aws-honeycomb/tree/master/CONTRIBUTING.md) for instructions.


## How is this Module versioned?

This Module follows the principles of [Semantic Versioning](http://semver.org/). You can find each new release, 
along with the changelog, in the [Releases Page](https://github.com/terra-farm/terraform-aws-honeycomb/releases). 

During initial development, the major version will be 0 (e.g., `0.x.y`), which indicates the code does not yet have a 
stable API. Once we hit `1.0.0`, we will make every effort to maintain a backwards compatible API and use the MAJOR, 
MINOR, and PATCH versions on each release to indicate any incompatibilities. 


## License

This code is released under the Apache 2.0 License. 
Please see [LICENSE](https://github.com/terra-farm/terraform-aws-honeycomb/tree/master/LICENSE) for more 
details.
