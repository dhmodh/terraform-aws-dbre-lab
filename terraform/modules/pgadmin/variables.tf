variable "environment" { type = string }
variable "network_name" { type = string }
variable "pgadmin_email" { type = string }
variable "pgadmin_password" {
  type      = string
  sensitive = true
}
variable "pgadmin_port" { type = number }
