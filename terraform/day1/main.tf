resource "docker_image" "postgres" {
  name = "postgres:15"
}

resource "docker_container" "postgres_db" {
  name  = "dbre-postgres"

  image = docker_image.postgres.image_id

  ports {
    internal = 5432
    external = 5432
  }

  env = [
    "POSTGRES_USER=admin",
    "POSTGRES_PASSWORD=password",
    "POSTGRES_DB=dbre_lab"
  ]
}
