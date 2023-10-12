# About

This is an infrastructure-as-code (IaC) repo which provisions EKS (Elastic Kubernetes Service) on AWS

The makefile here serves as a kind of executable set of convenience functions for creating clusters on AWS.

The script assumes an AWS account, the `aws` cli installed and logged in (e.g. an ~/.aws/credentials file with a [default] entry). See install instructions [here](./loggingIn.md)

# Github Actions Build

We configured our AWS account to use Open ID Connect, following [github’s recommendation for OIDC](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/about-security-hardening-with-openid-connect). 

The simplest instructions we've found are well-described [in this video](https://www.youtube.com/watch?v=aOoRaVuh8Lc).

With authentication in place, our [github actions](./.github/workflows/eks-cluster.yml) invoke our eksctl via our Makefile to provision a cluster.


# Using AWS Locally

## AWS CLI

Having [set up AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html).

in the AWS console:

see [here](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html)

```shell
aws sts get-caller-identity

export CLUSTER_NAME=kind-lab-dev-1
export AWS_REGION=eu-west-2
aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME


```

# Using EKSCTL

You can read more about eksctl [here](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html).
