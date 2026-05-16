variable "container_name" {
  description = "PostgreSQL container name"
  type        = string
  default     = "dbre-postgres"
}

variable "postgres_user" {
  description = "PostgreSQL username"
  type        = string
  default     = "admin"
}

variable "postgres_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true
  default     = "password"
}

variable "postgres_db" {
  description = "Database name"
  type        = string
  default     = "dbre_lab"
}

variable "postgres_port" {
  description = "PostgreSQL port"
  type        = number
  default     = 5432
}
