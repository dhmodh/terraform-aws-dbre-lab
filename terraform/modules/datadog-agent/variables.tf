variable "environment" {
  type = string
}

variable "network_name" {
  type = string
}

variable "datadog_api_key" {
  type      = string
  sensitive = true
}

variable "datadog_site" {
  type = string
}
