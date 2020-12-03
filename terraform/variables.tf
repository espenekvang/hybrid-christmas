variable "app_name" {
  description = "the name of the application"
}
variable "location" {
  description = "region to provision resources"
}
variable "resource_group_name" {
  description = "name of resource group to place resources in"
}
variable "service_plan_id" {
  description = "value"
}
variable "source_tag" {
  description = "the name of the source repository for this terraform"
}