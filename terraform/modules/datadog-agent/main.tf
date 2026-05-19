resource "docker_image" "datadog" {
  name = "gcr.io/datadoghq/agent:latest"
}

resource "docker_container" "datadog_agent" {
  name  = "${var.environment}-datadog-agent"
  image = docker_image.datadog.image_id

  env = [
    "DD_API_KEY=${var.datadog_api_key}",
    "DD_SITE=${var.datadog_site}",
    "DD_LOGS_ENABLED=true",
    "DD_APM_ENABLED=true",
    "DD_PROCESS_AGENT_ENABLED=true",
    "DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true"
  ]

  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }

  volumes {
    host_path      = "/Users/dishantmodh/terraform-aws-dbre-lab/monitoring/datadog/conf.d"
    container_path = "/etc/datadog-agent/conf.d"
  }

  networks_advanced {
    name = var.network_name
  }
}
