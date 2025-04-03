# terraform-infra

## A custom GitHub Actions module for terraform-infra pipelines

This is a custom module for use by terraform-<org>-infra repositories, such as terraform-ss-core-infra, terraform-simm-infra, etc.

## How to Use

There are three inputs with this repo:

AWS_IAM_Role:
    description: 'Cross Account role arn to assume to deploy infrastructure'
    required: false
    type: String
  SSM_private_keys:
    description: "comma separated list of ssm key locations, no spaces"
    required: false
    type: String
  SSM_pat:
    description: "Location of pat token in SSM"
    required: false
    type: String

If no IAM role is set, it will use whatever is set by default.
SSM_private keys can have multiple key locations separated by a comma. 
SSM_pat can only use one personal access token location.

All variables can be omitted or used

##How to use:

jobs:
  pipeline:
    runs-on: ubuntu-latest
    name: ${{ github.event.issue.pull_request && 'deploy' || 'plan' }}
    permissions: write-all
 
    steps:
      - name: run composite module
        uses: TRI-Actions/web-app-infra@main
        with:
          AWS_IAM_Role: arn:aws:iam::1234567890123:role/{IAM_ROLE_NAME}
          SSM_private_keys: /key/location/1,/key/location/2
          SSM_pat: /pat/location