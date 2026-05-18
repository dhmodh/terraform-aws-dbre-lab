resource "docker_image" "pgbouncer" {
  name = "edoburu/pgbouncer"
}

resource "docker_container" "pgbouncer" {
  name  = "${var.environment}-pgbouncer"
  image = docker_image.pgbouncer.image_id

  env = [
    "DATABASE_URL=postgres://${var.postgres_user}:${var.postgres_password}@postgres-primary:5432/${var.postgres_db}",
    "POOL_MODE=transaction",
    "MAX_CLIENT_CONN=500",
    "DEFAULT_POOL_SIZE=50",
    "AUTH_TYPE=plain",
    "AUTH_USER=${var.postgres_user}"
  ]

  ports {
    internal = 5432
    external = var.pgbouncer_port
  }

  networks_advanced {
    name = var.network_name
  }
}
