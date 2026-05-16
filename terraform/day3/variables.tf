variable "postgres_user" {
  default = "dishant"
}

variable "postgres_password" {
  sensitive = true
  default   = "dishant123"
}

variable "postgres_db" {
  default = "dbre_platform"
}

variable "postgres_port" {
  default = 5432
}

variable "pgadmin_email" {
  default = "admin@dbre.com"
}

variable "pgadmin_password" {
  sensitive = true
  default   = "admin123"
}
