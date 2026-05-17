
module "networking" {
  source = "../../modules/networking"

  environment  = var.environment
  network_name = var.network_name
}
