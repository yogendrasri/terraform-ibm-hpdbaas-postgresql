
# Resource Group Variables
variable "resource_group_name" {
  type        = string
  description = "Existing resource group where the IKS cluster will be provisioned."
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The api key for IBM Cloud access"
}

variable "region" {
  type        = string
  description = "Region for VLANs defined in private_vlan_number and public_vlan_number."
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster"
  default     = ""
}
variable "name_prefix" {
  type        = string
  description = "Prefix name that should be used for the cluster and services. If not provided then resource_group_name will be used"
  default     = ""
}
variable "hpcs-region" {
  type        = string
  description = "The region where the Key Protect instance has been provisioned"
  default     = ""
}

variable "hpcs-name" {
  type        = string
  description = "The name of the Key Protect instance"
  default     = ""
}

variable "hpcs-key" {
  type        = string
  description = "The name of the key in the Key Protect instance"
  default     = ""
}

variable "authorize-kms" {
  type        = string
  description = "Flag indicating that the authorization for MongoDB to read keys in the KMS should be created"
  default     = "true"
}
