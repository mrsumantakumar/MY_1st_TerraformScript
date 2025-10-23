module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.21.0"

  # Cluster (control plane)
  cluster_name                   = local.name
  cluster_version                = "1.30"
  cluster_endpoint_public_access = true

  # Networking
  vpc_id                    = module.vpc.vpc_id
  subnet_ids                = module.vpc.private_subnets
  control_plane_subnet_ids  = module.vpc.intra_subnets

  # Node group defaults
  eks_managed_node_group_defaults = {
    instance_types                        = ["t3.medium"]
    attach_cluster_primary_security_group = true
  }

  # Node groups
  eks_managed_node_groups = {
    skn-cluster-ng = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 2
      instance_types   = ["t2.medium"]
      capacity_type    = "SPOT"
    }
  }

  # Cluster addons
  cluster_addons = {
    vpc-cni = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    core-dns = {
      most_recent = true
    }
  }

  # Tags
  tags = {
    Environment = local.env
    Terraform   = "true"
  }
}
