output "ecr_repository_worker_endpoint" {
  value = aws_ecr_repository.partham.repository_url
}