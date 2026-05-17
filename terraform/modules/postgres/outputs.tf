output "primary_name" {
  value = docker_container.postgres_primary.name
}

output "replica_name" {
  value = docker_container.postgres_replica.name
}
