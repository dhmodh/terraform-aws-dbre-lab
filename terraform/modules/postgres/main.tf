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

  command = [
    "postgres",
    "-c",
    "config_file=/etc/postgresql/postgresql.conf",
    "-c",
    "hba_file=/etc/postgresql/pg_hba.conf"
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
  volumes {
    host_path      = abspath("${path.root}/../../../scripts/postgres/config/postgresql.conf")
    container_path = "/etc/postgresql/postgresql.conf"
  }

  volumes {
    host_path      = abspath("${path.root}/../../../scripts/postgres/config/pg_hba.conf")
    container_path = "/etc/postgresql/pg_hba.conf"
  }
}

resource "docker_container" "postgres_replica" {
  name     = "${var.environment}-postgres-replica"
  hostname = "postgres-replica"

  image = docker_image.postgres.image_id

  depends_on = [
    docker_container.postgres_primary
  ]

  env = [
    "POSTGRES_PASSWORD=${var.postgres_password}"
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

  command = [
    "bash",
    "-c",
    <<EOT
  sleep 40

  rm -rf /var/lib/postgresql/data/*

  PGPASSWORD=replica123 pg_basebackup \
  -h postgres-primary \
  -D /var/lib/postgresql/data \
  -U replicator \
  -Fp \
  -X stream \
  -P \
  -R

  chown -R postgres:postgres /var/lib/postgresql/data
  chmod 0700 /var/lib/postgresql/data

  su postgres -c "postgres"
 EOT
 ]

}
