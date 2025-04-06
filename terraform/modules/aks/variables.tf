variable "cluster_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "dns_prefix" {}
variable "kubernetes_version" {
  default = "1.29.0"
}
variable "node_count" {
  default = 2
}
variable "vm_size" {
  default = "Standard_DS2_v2"
}
variable "tenant_id" {}
variable "admin_group_object_id" {}
variable "environment" {}
