output "postgres_container" {
  value = docker_container.postgres_db.name
}

output "pgadmin_url" {
  value = "http://localhost:8080"
}

output "network_name" {
  value = docker_network.dbre_network.name
}
