module "dev_tools_mongodb" {
  source = "./module"

  resource_group_name = var.resource_group_name
  resource_location   = var.region
  name_prefix         = "${var.name_prefix}_2"
  hpcs-region  = var.hpcs-region
  hpcs-name    = var.hpcs-name
  hpcs-key     = var.hpcs-key
  authorize-kms       = var.authorize-kms == "true"
}
