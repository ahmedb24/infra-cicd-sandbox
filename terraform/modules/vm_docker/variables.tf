variable "name" { type = string }
variable "image" {
  type    = string
  default = "ubuntu:22.04"
}
variable "cpu" {
  type    = number
  default = 1
}
variable "memory_mb" {
  type    = number
  default = 1024
}
variable "command" {
  type    = list(string)
  default = ["sleep", "infinity"]
}
