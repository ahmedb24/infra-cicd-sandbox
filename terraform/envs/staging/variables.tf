variable "env" { 
  type = string
  default = "staging" 
}
variable "vnet_cidr" { default = "10.30.0.0/16" }
variable "subnet_cidr" { default = "10.30.1.0/24" }
variable "kind_node_image" { default = "kindest/node:v1.29.4" }
variable "kind_config_yaml" {
  type    = string
  default = null
}
variable "vm_image" { default = "ubuntu:22.04" }
variable "vm_cpu" { default = 1 }
variable "vm_memory_mb" { default = 768 }
