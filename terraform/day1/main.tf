resource "docker_image" "postgres" {
  name = "postgres:15"
}

resource "docker_container" "postgres_db" {
  name  = var.container_name
  image = docker_image.postgres.image_id

  ports {
    internal = var.postgres_port
    external = var.postgres_port
  }

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]
}
