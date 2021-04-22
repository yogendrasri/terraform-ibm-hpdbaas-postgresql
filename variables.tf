variable "ibmcloud_api_key" {
  type        = string
  description = "The api key for IBM Cloud access"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group where the cluster has been provisioned."  
}

variable "resource_location" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
  #default = "us-south"
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = []
}

variable "name_prefix" {
  type        = string
  description = "The prefix name for the service. If not provided it will default to the resource group name"
  default     = ""
}

# mongodb-flexible or mongodb-free
variable "plan" {
  type        = string
  description = "The type of plan the service instance should run under (standard)"
  default     = "mongodb-free"
}

variable "private_endpoint" {
  type        = string
  description = "Flag indicating that the service should be created with private endpoints"
  default     = "true"
}

variable "role" {
  type        = string
  description = "The role of the generated credential (Viewer, Administrator, Operator, Editor)"
  default     = "Editor"
}

variable "hpcs-region" {
  type        = string
  description = "The region where the hpcs instance has been provisioned. If not provided defaults to the same region as the MongoDB instance"
  default     = ""
}

variable "hpcs-resource-group" {
  type        = string
  description = "The resource group where the hpcs instance has been provisioned. If not provided defaults to the same resource group as the MongoDB instance"
  default     = ""
}

variable "hpcs-name" {
  type        = string
  description = "The name of the hpcs instance"
  default     = "appdev-cloud-native-hpcs"
}

variable "hpcs-key" {
  type        = string
  description = "The id of the key in the hpcs instance"
  default     = "d9d7811e-afd5-41dd-89da-c472b89fd896"
}

variable "authorize-kms" {
  type        = bool
  description = "Flag indicating that the authorization for Hyper Protect DBaaS for MongoDB to read keys in the KMS should be created"
  default     = false
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster"
  default     = "dbaas-cluster"
}

variable "admin_name" {
  type        = string
  description = "The name of the database admin"
  default     = "admin"
}

variable "password" {
  type        = string
  description = "The password of database admin"
  default     = "Workstation*123"
}

variable "confirm_password" {
  type        = string
  description = "The confirm-password of database admin"
  default     = "Workstation*123"
}

variable "storage" {
  type        = string
  description = "The name of the database admin"
  default     = "5GiB"
}

variable "memory" {
  type        = string
  description = "The name of the database admin"
  default     = "3GiB"
}

variable "cpu" {
  type        = string
  description = "The name of the database admin"
  default     = "1"
}


