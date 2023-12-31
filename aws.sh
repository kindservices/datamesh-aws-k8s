#!/usr/bin/env bash

export CLUSTER_NAME=${CLUSTER_NAME:-kind-idealab1-dev}
export AWS_REGION=${AWS_REGION:-eu-west-2}
export NODE_TYPE=${NODE_TYPE:-"t3.small"}
export NODE_COUNT=${NODE_COUNT:-5}
echo "CLUSTER_NAME : $CLUSTER_NAME"
echo "AWS_REGION   : $AWS_REGION"
echo "NODE_TYPE    : $NODE_TYPE"
echo "NODE_COUNT   : $NODE_COUNT"

function installEksCtl() {
    echo "installing eksctl"
    brew tap weaveworks/tap || echo "couldn't tap weaveworks"
    brew install weaveworks/tap/eksctl || echo "couldn't install weaveworks/tap/eksctl"
}

function ensureEKSCTL() {
    echo -ne "checking EKSCTL `which eksctl`\r"
    echo "checking eksctl `which eksctl`"
    (which eksctl && echo "eksctl is installed") || installEksCtl
}

# 
function createCluster() {
    echo "creating cluster"
    eksctl create cluster --name $CLUSTER_NAME --region $AWS_REGION --nodegroup-name ${CLUSTER_NAME}-nodes --node-type $NODE_TYPE --nodes $NODE_COUNT
}

function deleteCluster() {
    eksctl delete cluster --name $CLUSTER_NAME
}

function ensureClusterCreated() {
    echo "get cluster..."
    getCluster && echo "cluster exists" || createCluster
}

getCluster() {
    eksctl get cluster --name=$CLUSTER_NAME --region=$AWS_REGION
}

function updateLocalKubeConfig() {
    echo "updating kubectl config"
    # https://docs.aws.amazon.com/cli/latest/reference/sts/get-caller-identity.html
    # aws sts get-caller-identity

    aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME
}