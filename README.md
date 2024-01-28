# Terraform Module for AWS S3 bucket creation

A Terraform module which creates an S3 bucket with the feature to modify the access and versioning of the bucket.

## Features

- Create S3 bucket using **_bucket_name_** variable to specify the name of the bucket(string). **REQUIRED**
  - Accepted values:
    - Any globally unique string (required by AWS).
    - Please refer for more detail: https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
- Specify the Access Control for the bucket using **_bucket_public_access_** variable(boolean). **OPTIONAL**
  - Accepted values:
    - true : Enables public access. (Use with caution).
    - false : Disables public access. **DEFAULT**
- Enable or disable _versioning_ for the bucket using **_bucket_versioning_** variable(boolean). **OPTIONAL**
  - Accepted values:
    - true : Enables bucket versioning.
    - false : Disables bucket versioning. **DEFAULT**

## Outputs

There are 3 outputs which the user can access

- **id** : Returns the id of the created bucket.
- **arn** : Returns the arn (Amazon Resource Name) of the created bucket
- **domain_name** : Returns the domain name of the created bucket

## Usage

Firstly, import the module in your terraform project

    module "[variable-name]" {
     source = "github.com/Legin-ML/terraform_s3_bucket"

     bucket_name = "<your-bucket-name>"
    }

[variable-name] can be any name you want.

## Examples

The module name and output can be set to the user's preference. In this example, "s3_bucket" is used.

### Bucket with no public access and no versioning

    '''HCL
    module "s3_bucket" {
     source = "github.com/Legin-ML/terraform_s3_bucket"

     bucket_name = "<your-bucket-name>"

     # Optional arguments are assumed as default.
    }
    '''

### Bucket with public access

    module "s3_bucket" {
     source = "github.com/Legin-ML/terraform_s3_bucket"

     bucket_name = "<your-bucket-name>"
     bucket_public_access = true
    }

### Bucket with versioning

    module "s3_bucket" {
     source = "github.com/Legin-ML/terraform_s3_bucket"

     bucket_name = "<your-bucket-name>"
     bucket_versioning = true
    }

### Bucket with Outputs

    module "s3_bucket" {
     source = "github.com/Legin-ML/terraform_s3_bucket"

     bucket_name = "<your-bucket-name>"
     bucket_versioning = false
     bucket_public_access = true
    }

    output "s3_domain"{
     value = "${module.s3_bucket.domain_name}"
    }
    # The other outputs are declared like this block
