variable "environment" { type = string }
variable "network_name" { type = string }
variable "postgres_user" { type = string }
variable "postgres_password" {
  type      = string
  sensitive = true
}
variable "postgres_db" { type = string }
variable "primary_port" { type = number }
variable "replica_port" { type = number }
variable "pgadmin_email" { type = string }
variable "pgadmin_password" {
  type      = string
  sensitive = true
}
variable "pgadmin_port" { type = number }
variable "pgbouncer_port" {
  type = number
}
