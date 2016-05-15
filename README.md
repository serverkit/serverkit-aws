# serverkit-s3
[Serverkit](https://github.com/serverkit/serverkit) plug-in for Amazon S3.

## Install
```rb
# Gemfile
gem "serverkit-s3"
```

## Resource
### s3_bucket
Create a S3 bucket.

#### Attributes
- name - S3 bucket name (required) (e.g. `"my-bucket"`)

#### Example
```yml
resources:
  - type: s3_bucket
    name: my-bucket
```
