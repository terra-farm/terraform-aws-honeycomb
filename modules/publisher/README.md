# Honeycomb Publisher for Lambda

The Honeycomb Publisher for Lambda receives and publishes Honeycomb events on behalf of other Honeycomb-instrumented Lambda functions. It allows events to be sent asynchronously, rather 
than blocking the upstream function. The source function is modified so that its instrumentation goes to STDOUT. Lambda writes this output to a Cloudwatch Log Group, and the publisher subscribes to one or more Cloudwatch Log Groups and sends the instrumentation on to Honeycomb.

A sample event looks like this. Fields are stored in the `data` map, the event timestamp comes from the `time` field, and the target dataset is specified in `dataset`. If `dataset` is missing, events go to a fallback dataset (see below).

```json
{
    "data": {
        "key": "8825.samplerate.int32c",
        "object_size": 537310,
        "open_elapsed_ms": 111,
        "reached_eof": true,
        "stream_total_ms": 689,
        "sum_bytes_read": 537310
    },
    "time": "2019-08-20T18:53:08.443956295Z",
    "dataset": "target-dataset"
}
```

[Honeycomb Beelines](https://docs.honeycomb.io/getting-data-in/beelines/) and SDKs have built-in support for output to STDOUT. Consult the documentation for your language to learn how to enable it.

## How to use this Module

Example:

```hcl
module "honeycomb_publisher" {
  source               = "terra-farm/honeycomb/aws/modules/publisher"
  version              = "0.0.3"
  project              = "your-application-project-name"
  environment          = "production"
  # defines which log groups to read from.
  subscription_filters = ["/path/to/my/log/group1", "/path/to/my/log/group/2"]
  # used as a fallback if no dataset is included in the event data
  dataset              = "your-dataset-name-on-honeycomb"
  lambda_version       = "1.6.0"
  honeycomb_write_key  = "CiphertextBlob-of-your-KMS-encrypted-honeycomb-write-key"
  kms_key_id           = "kms-key-id-used-to-encrypt-the-write-key"
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
