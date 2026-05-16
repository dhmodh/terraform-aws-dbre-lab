output "container_name" {
  value = docker_container.postgres_db.name
}

output "postgres_image" {
  value = docker_image.postgres.name
}

output "database_port" {
  value = var.postgres_port
}
