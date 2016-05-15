# serverkit-aws
[Serverkit](https://github.com/serverkit/serverkit) plug-in for Amazon Web Services (AWS).

## Install
```rb
# Gemfile
gem "serverkit-aws"
```

## Resource
### s3_bucket
Create a S3 bucket.

#### Attributes
- name - S3 bucket name (required) (e.g. `"my-bucket"`)
- aws_access_key_id - AWS access key ID
- aws_region - AWS region
- aws_secret_access_key - AWS secret access key

Note: serverkit-s3 searches the following locations for credentials and a region:

- `ENV["AWS_ACCESS_KEY_ID"]`
- `ENV["AWS_REGION"]`
- `ENV["AWS_SECRET_ACCESS_KEY"]`
- The shared credentials ini file at `~/.aws/credentials`
- From an instance profile when running on EC2

#### Example
```yml
resources:
  - type: s3_bucket
    name: my-bucket
    aws_region: ap-northeast-1
```
