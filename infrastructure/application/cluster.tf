resource "aws_eks_cluster" "workshop" {
  name     = "workshop"
  version  = "1.14"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids         = data.terraform_remote_state.foundation.outputs.public_subnets
    security_group_ids = [data.terraform_remote_state.foundation.outputs.public_security_group]
  }

  tags = var.tags
}

resource "aws_eks_node_group" "applications" {
  node_group_name = "applications"
  cluster_name    = aws_eks_cluster.workshop.name
  node_role_arn   = aws_iam_role.eks_nodes.arn

  instance_types = ["t3.small"]

  scaling_config {
    desired_size = 3
    min_size     = 3
    max_size     = 6
  }

  subnet_ids = data.terraform_remote_state.foundation.outputs.applications_subnets

  tags = var.tags
}
