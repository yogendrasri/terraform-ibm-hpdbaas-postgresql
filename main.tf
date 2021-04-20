data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "ibm_resource_group" "hpcs_resource_group" {
  name = var.hpcs-resource-group
}

locals {
  service            = "hyperp-dbaas-mongodb"
  name_prefix        = var.name_prefix != "" ? var.name_prefix : var.resource_group_name
  name               = "${replace(local.name_prefix, "/[^a-zA-Z0-9_\\-\\.]/", "")}-hpdbaas-mongodb"
  hpcs-resource-group = var.hpcs-resource-group != "" ? var.hpcs-resource-group : var.resource_group_name
  hpcs-region = var.hpcs-region != "" ? var.hpcs-region : var.resource_location
  kyok-enabled       = var.hpcs-name != "" && var.hpcs-key != ""
  parameters = {
        cpu = var.cpu
        name = var.cluster_name
        admin_name = var.admin_name
        password = var.password
        confirm_password = var.confirm_password
        storage = var.storage
        memory = var.memory
        #disk_encryption_key_crn = local.kyok-enabled ? data.ibm_kms_key.key[0].keys[0].crn : 0
        kms_instance = local.kyok-enabled ? data.ibm_resource_instance.hpcs_instance[0].id : ""        
        kms_key = local.kyok-enabled ? var.hpcs-key : ""
        service_endpoints = var.private_endpoint == "true" ? "private" : "public"
 } 
  
}

resource "null_resource" "print_hpcs_guid" {
  count = local.kyok-enabled ? 1 : 0

  provisioner "local-exec" {
    command = "echo \"KYOK enabled: ${local.kyok-enabled}, hpcs: ${data.ibm_resource_instance.hpcs_instance[0].guid}\""
  }
}

resource "null_resource" "print-params" {
  provisioner "local-exec" {
    command = "echo \"parameters: ${jsonencode(local.parameters)}\""
  }
}

data "ibm_resource_instance" "hpcs_instance" {
  count = local.kyok-enabled ? 1 : 0

  name = var.hpcs-name
  location = local.hpcs-region
  resource_group_id = data.ibm_resource_group.hpcs_resource_group.id
}

resource "ibm_iam_authorization_policy" "policy" {
  count = local.kyok-enabled && var.authorize-kms ? 1 : 0

  source_service_name         = local.service
  target_service_name         = "kms"
  roles                       = ["Reader"]
}

resource "ibm_resource_instance" "hyperp-dbaas-mongodb_instance" {
  depends_on = [ibm_iam_authorization_policy.policy]

  name                 = local.name
  service              = local.service
  plan                 = var.plan
  location             = var.resource_location
  resource_group_id    = data.ibm_resource_group.resource_group.id
  tags                 = var.tags    
  parameters = local.parameters   

  timeouts {
    create = "60m"
    update = "15m"
    delete = "15m"
  }
}

data "ibm_resource_instance" "hyperp-dbaas-mongodb_instance" {
  depends_on        = [ibm_resource_instance.hyperp-dbaas-mongodb_instance]

  name              = local.name
  resource_group_id = data.ibm_resource_group.resource_group.id
  location          = var.resource_location
  service           = local.service
  
}
