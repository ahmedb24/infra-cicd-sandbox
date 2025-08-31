output "vnet_id" { value = "mock-vnet-${var.env}" }
output "subnet_id" { value = "mock-subnet-${var.env}" }
output "nsg_rules" { value = local.nsg_rules }
