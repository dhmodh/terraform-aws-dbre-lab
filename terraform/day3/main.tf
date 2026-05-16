resource "docker_network" "dbre_network" {
  name = "dbre-network"
}

resource "docker_volume" "postgres_data" {
  name = "postgres-data"
}

resource "docker_image" "postgres" {
  name = "postgres:15"
}

resource "docker_container" "postgres_db" {
  name  = "dbre-postgres"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]

  ports {
    internal = 5432
    external = 5432
  }

  volumes {
    volume_name    = docker_volume.postgres_data.name
    container_path = "/var/lib/postgresql/data"
  }

  networks_advanced {
    name = docker_network.dbre_network.name
  }
}

resource "docker_image" "pgadmin" {
  name = "dpage/pgadmin4"
}

resource "docker_container" "pgadmin" {
  name  = "dbre-pgadmin"
  image = docker_image.pgadmin.image_id

  env = [
    "PGADMIN_DEFAULT_EMAIL=${var.pgadmin_email}",
    "PGADMIN_DEFAULT_PASSWORD=${var.pgadmin_password}"
  ]

  ports {
    internal = 80
    external = 8080
  }

  networks_advanced {
    name = docker_network.dbre_network.name
  }
}
