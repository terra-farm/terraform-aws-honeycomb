# Honeycomb AWS Module

This repo contains a set of modules in the [modules folder](https://github.com/terra-farm/terraform-aws-honeycomb/tree/master/modules) 
for deploying the [agentless AWS integrations](https://github.com/honeycombio/agentless-integrations-for-aws) 
for [Honeycomb.io](https://honeycomb.io).

These are production ready versions of the [terraform](https://github.com/honeycombio/agentless-integrations-for-aws/tree/master/terraform) 
examples in the Honeycomb Git repository.

## How to use this Module

This repo has the following folder structure:

* [modules](https://github.com/terra-farm/terraform-aws-honeycomb/tree/master/modules): This folder contains several standalone, reusable, production-grade modules.
* [root folder](https://github.com/terra-farm/terraform-aws-honeycomb/tree/master): The root folder is *empty* and can not be used.

To deploy the agentless integration for a specific log/metrics aggregation to Honeycomb.io:

* [postgresql](https://github.com/terra-farm/terraform-aws-honeycomb/blob/master/modules/postgresql/README.md)
* [publisher](https://github.com/terra-farm/terraform-aws-honeycomb/blob/master/modules/publisher/README.md)

## How do I contribute to this Module?

Contributions are very welcome! Check out the [Contribution Guidelines](https://github.com/terra-farm/terraform-aws-honeycomb/tree/master/CONTRIBUTING.md) for instructions.


## How is this Module versioned?

This Module follows the principles of [Semantic Versioning](http://semver.org/). You can find each new release, 
along with the changelog, in the [Releases Page](../../releases). 

During initial development, the major version will be 0 (e.g., `0.x.y`), which indicates the code does not yet have a 
stable API. Once we hit `1.0.0`, we will make every effort to maintain a backwards compatible API and use the MAJOR, 
MINOR, and PATCH versions on each release to indicate any incompatibilities. 


## License

This code is released under the Apache 2.0 License. 
Please see [LICENSE](https://github.com/terra-farm/terraform-aws-honeycomb/tree/master/LICENSE) for more 
details.
