# serverkit-aws
[Serverkit](https://github.com/serverkit/serverkit) plug-in for Amazon Web Services (AWS).

## Install
```rb
# Gemfile
gem "serverkit-aws"
```

## Resource
### cloud_front_web_distribution
Create a CloudFront web distribution.

#### Attributes
- aws_access_key_id - AWS access key ID
- aws_region - AWS region
- aws_secret_access_key - AWS secret access key
- distribution_config - distribution_config parameter

Note: some default parameters are reverse-merged into given distribution_config.

#### Example
```yml
resources:
  - type: cloud_front_web_distribution
    aws_region: ap-northeast-1
    distribution_config:
      caller_reference: test
      default_cache_behavior:
        target_origin_id: S3-test
      origins:
        items:
          - id: S3-test
            domain_name: test.s3.amazonaws.com
            s3_origin_config:
              origin_access_identity: ""
        quantity: 1
```

### s3_bucket
Create a S3 bucket.

#### Attributes
- aws_access_key_id - AWS access key ID
- aws_region - AWS region
- aws_secret_access_key - AWS secret access key
- name - S3 bucket name (required) (e.g. `"my-bucket"`)

#### Example
```yml
resources:
  - type: s3_bucket
    name: my-bucket
    aws_region: ap-northeast-1
```

## Credentials and Region
serverkit-aws searches the following locations for credentials and a region:

- `ENV["AWS_ACCESS_KEY_ID"]`
- `ENV["AWS_REGION"]`
- `ENV["AWS_SECRET_ACCESS_KEY"]`
- The shared credentials ini file at `~/.aws/credentials`
- From an instance profile when running on EC2
