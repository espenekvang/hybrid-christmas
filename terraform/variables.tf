variable "app_name" {
  description = "the name of the application"
}
variable "northpole_hostname" {
  description = "the hostname on-prem that is to be exposed over hybrid connection"
}
variable "northpole_hostport" {
  description = "the portnumber for enpoint on-prem that is to be exposed over hybrid connection"
}
variable "location" {
  description = "region to provision resources"
}
variable "relay_name" {
  description = "name of relay to be used for hybrid connection"
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