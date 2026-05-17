resource "docker_volume" "primary_data" {
  name = "${var.environment}-primary-data"
}

resource "docker_volume" "replica_data" {
  name = "${var.environment}-replica-data"
}

resource "docker_image" "postgres" {
  name = "postgres:15"
}

resource "docker_container" "postgres_primary" {
  name     = "${var.environment}-postgres-primary"
  hostname = "postgres-primary"
  image    = docker_image.postgres.image_id

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]

  ports {
    internal = 5432
    external = var.primary_port
  }

  volumes {
    volume_name    = docker_volume.primary_data.name
    container_path = "/var/lib/postgresql/data"
  }

  volumes {
    host_path      = abspath("${path.root}/../../../scripts/postgres/init")
    container_path = "/docker-entrypoint-initdb.d"
 }

  healthcheck {
    test         = ["CMD-SHELL", "pg_isready -U ${var.postgres_user}"]
    interval     = "10s"
    retries      = 5
    start_period = "20s"
    timeout      = "5s"
  }

  networks_advanced {
    name = var.network_name
  }
}

resource "docker_container" "postgres_replica" {
  name     = "${var.environment}-postgres-replica"
  hostname = "postgres-replica"
  image    = docker_image.postgres.image_id

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]

  ports {
    internal = 5432
    external = var.replica_port
  }

  volumes {
    volume_name    = docker_volume.replica_data.name
    container_path = "/var/lib/postgresql/data"
  }

  networks_advanced {
    name = var.network_name
  }
}
