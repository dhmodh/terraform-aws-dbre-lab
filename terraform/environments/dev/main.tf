module "networking" {
  source = "../../modules/networking"

  environment  = var.environment
  network_name = var.network_name
}

module "postgres" {
  source = "../../modules/postgres"

  environment       = var.environment
  network_name      = module.networking.network_name
  postgres_user     = var.postgres_user
  postgres_password = var.postgres_password
  postgres_db       = var.postgres_db
  primary_port      = var.primary_port
  replica_port      = var.replica_port
}

module "pgbouncer" {
  source = "../../modules/pgbouncer"

  environment       = var.environment
  network_name      = module.networking.network_name
  postgres_user     = var.postgres_user
  postgres_password = var.postgres_password
  postgres_db       = var.postgres_db
  pgbouncer_port    = var.pgbouncer_port
}

module "datadog_agent" {
  source = "../../modules/datadog-agent"

  environment     = var.environment
  network_name    = module.networking.network_name
  datadog_api_key = var.datadog_api_key
  datadog_site    = var.datadog_site
}

module "pgadmin" {
  source = "../../modules/pgadmin"

  environment      = var.environment
  network_name     = module.networking.network_name
  pgadmin_email    = var.pgadmin_email
  pgadmin_password = var.pgadmin_password
  pgadmin_port     = var.pgadmin_port
}
