#####	RAK_EKS_Terraform_Project	#####

This document will help to understand how to provision the AWS Infrastructure & EKS cluster to deploy the Java application.

# Technologies used

    Terraform v1.7.0
    aws-cli/2.15.12
	Kubectl utility
	Eksctl utility

# Prerequisites

1.  AWS S3 bucket for storing the Terraform backend file
2. AWS access key & Secret access keys with root access.
3. EC2 key pair for instances creation
4. Create an EKS cluster role with sufficient privilleges (EKS_Cluster_Role)

# Execution Methodology


1. Declare variables
	-	Create  variables.tf file and declare below mentioned variables.

			* AWS Region
			* Access Key
			* Secret Access Key
			* EC2 Key pair

2. Configure Backend
	-	Create terraform.tf to configure AWS S3 bucket as backend for storring Terraform state file.
	-	Modify the Bucket name with a relevant one, no need to change the key.

3. Create Infrastructure (VPC)
	-	Create a new VPC with below components

			*   Public Subnet
			*   Private Subets
			*   Internet Gateway
			*   NAT Gateway

4. Create Cluster
	-	Create a role EKS_Cluster_Role with cluster creation permissions.
	-	Create a cluster using EKS module  with EKS_managed_Group as mentioned below,

				module "eks" {
				source  = "terraform-aws-modules/eks/aws"
				version = "19.15.3"
				cluster_name    = local.cluster_name
				cluster_version = "1.27"
				vpc_id                         = module.vpc.vpc_id
				subnet_ids                     = module.vpc.public_subnets
				cluster_endpoint_public_access = true
				eks_managed_node_group_defaults = {
					ami_type = "AL2_x86_64"
				}
				eks_managed_node_groups = {
					one = {
					name = "node-group-1"
					node_role_arn = "arn:aws:iam::101006311811:role/EKS_Cluster_Role"
					instance_types = ["t3.small"]
					key_name = var.EC2_Key_Name

5. Configure IRSA, OIDC & CSI
	-	Configure IRSA - IAM Roles for Service Accounts
	-	Configure IAM OIDC provider
	-	Configure Container Storage Interface (CSI) driver for Kubernetes to integrate with EBS storage

6. Ensure the Cluster is up and running my navigationg to AWS EKS console and do cross check the Terraform Outputs.
	-	Below parameters have been described under outputs.tf file.
				
                    *	Cluster_endpoint
				*	Cluster_security_group_id
				*	Region
				*	Cluster_name
