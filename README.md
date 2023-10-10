# About

This is an infrastructure-as-code (IaC) repo which provisions EKS (Elastic Kubernetes Service) on AWS

The makefile here serves as a kind of executable set of convenience functions for creating clusters on AWS.

The script assumes an AWS account, the `aws` cli installed and logged in (e.g. an ~/.aws/credentials file with a [default] entry). See install instructions [here](./loggingIn.md)

# Github Actions Build

This repo is setup with github actions in ./github/workflow, which need an `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` setting up.

See [here](./awsIAM.md) for setting up AWS IAM.

See https://github.com/marketplace/actions/kubectl-aws-eks


# Local Usage

You can use this makefile locally as well provided you have an `aws` CLI installed (see [here](./loggingIn.md))

## Create a cluster on AWS:
```
make CLUSTER_NAME=example
```

# get the cluster info
```
make getCluster
```

## Delete a cluster on AWS:
```
make deleteCluster CLUSTER_NAME=example
```