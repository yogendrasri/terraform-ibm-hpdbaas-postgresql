module "hpdbaas_postgresql" {
  source = "./module"

  resource_group_name = module.resource_group.name
  resource_location   = var.region
  name_prefix         = "${var.name_prefix}_2"
  #hpcs-resource-group = var.hpcs-resource-group
  #hpcs-region  = var.hpcs-region
  #hpcs-name    = var.hpcs-name
  #hpcs-key     = var.hpcs-key
  authorize-kms       = var.authorize-kms == "true"
  ibmcloud_api_key    = var.ibmcloud_api_key
}
