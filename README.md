# tf_state_mgmt

Terraform remote state management module. Uses Terraform versions - 0.12 and above.

## Why

[Remote state](https://www.terraform.io/docs/state/remote.html) is the preferred way of managing infra state in
Terraform. The first step of creating Terraform infrastructure involves creating the remote state S3 bucket in AWS.
However, this step is mostly done **manually** and is not uniformly done across projects i.e. some state buckets
have versioning enabled, some have logging enabled, etc. This module aims to have a standard, uniform way of creating
Terraform remote state S3 buckets catering to a variety of options.

### Different ways of creating AWS remote state

1. Plain S3 bucket

    The easiest way. Go to the console. Create an S3 bucket and use that name for
    future infra creation. Useful for storing state remotely so that local state
    checkins in git don't conflict.

2. S3 bucket with versioning enabled

    [Versioning](https://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html) involves
    switching on a flag while S3 bucket creation, which can help you version the files created
    in that bucket. This is useful to compare Terraform state change.

3. S3 bucket with logging enabled

    [Logging](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerLogs.html) involves
    creating a different logging bucket and pointing the state bucket to the logging bucket to
    store logs of who accessed the state bucket and when. This is useful for audit trails to
    know who made changes to your infra.

4. S3 bucket with backend DynamoDB table for locking

    Terrform provides remote state with [locking](https://www.terraform.io/docs/state/remote.html)
    functionality, which makes Terraform take/release a lock on an entry in a pre-created DynamoDB
    table while running operations. This is useful in preventing race conditions where 2 or more
    users are trying to change the same resources.

5. Mix of any/all of the above

    1. S3 bucket +/- versionig +/- logging +/- DynamoDB table.

This module aims to give the user flexiblity to do option 5 in a uniform way.

### Talk is cheap - show me the code

1. Input variables to this module are described in [TERRAFORM.md](./TERRAFORM.md)
2. [Sample repo](https://github.com/saurabh-hirani/terraform-aws-state-mgmt-sample-infra) using **S3 + versioning + logging + locking setup** of this module.
3. Examples in this repo:
   * [Simple s3 state](./examples/s3)
   * [S3 + versioning](./examples/s3_versioning)
   * [S3 + versioning + logging](./examples/s3_versioning_logging) - this example
     shows logging to both - an existing log bucket and creating a new log bucket.
   * [S3 + versioning + logging + locking](./examples/s3_versioning_logging_locking)

### How to build this module

This module uses a simple [Rakefile](https://github.com/saurabh-hirani/tf_state_mgmt/blob/master/Rakefile) and a [VERSION](https://github.com/saurabh-hirani/tf_state_mgmt/blob/master/VERSION)
file for following [semantic versioning](https://semver.org/).

1. To release a patch version of this module:

    ```sh
    rake release
    ```

    OR

    ```sh
    rake release:patch
    ```

2. To release a minor version of this module:

    ```sh
    rake release:minor
    ```

3. To release a major version of this module:

    ```sh
    rake release:major
    ```
