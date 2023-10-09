# use our EKS cluster
updateLocalKubeConfig: ensureClusterCreated
	. aws.sh && updateLocalKubeConfig

# get EKS cluster info
getCluster:
	. aws.sh && getCluster

deleteCluster:
	. aws.sh && deleteCluster

# creates our EKS cluster on AWS based on the 'initSettings' config
ensureClusterCreated: installEksCtl
	. aws.sh && ensureClusterCreated

# prerequisite - just check eksctl is installed (and install if needed)
installEksCtl:
	. aws.sh && ensureEKSCTL