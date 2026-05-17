resource "docker_image" "pgadmin" {
  name = "dpage/pgadmin4"
}

resource "docker_container" "pgadmin" {
  name  = "${var.environment}-pgadmin"
  image = docker_image.pgadmin.image_id

  env = [
    "PGADMIN_DEFAULT_EMAIL=${var.pgadmin_email}",
    "PGADMIN_DEFAULT_PASSWORD=${var.pgadmin_password}"
  ]

  ports {
    internal = 80
    external = var.pgadmin_port
  }

  networks_advanced {
    name = var.network_name
  }
}
