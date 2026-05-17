output "network_name" {
  value = module.networking.network_name
}

output "postgres_primary" {
  value = module.postgres.primary_name
}

output "postgres_replica" {
  value = module.postgres.replica_name
}

output "pgadmin_url" {
  value = module.pgadmin.pgadmin_url
}
