variable "name" { type = string }
variable "node_image" {
  type    = string
  default = "kindest/node:v1.29.4"
}
variable "config" {
  type    = string
  default = null
}
