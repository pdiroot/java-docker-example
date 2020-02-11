output "endpoint" {
  value = aws_eks_cluster.workshop.endpoint
}

output "certificate_authority" {
  value = aws_eks_cluster.workshop.certificate_authority.0.data
}
