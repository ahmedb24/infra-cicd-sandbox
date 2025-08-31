module "network" {
  source      = "../../modules/network_mock"
  env         = var.env
  vnet_cidr   = var.vnet_cidr
  subnet_cidr = var.subnet_cidr
}

module "k8s" {
  source     = "../../modules/k8s_kind"
  name       = "finserve-${var.env}"
  node_image = var.kind_node_image
  config     = var.kind_config_yaml
}

module "vm" {
  source    = "../../modules/vm_docker"
  name      = "finserve-${var.env}-vm"
  image     = var.vm_image
  cpu       = var.vm_cpu
  memory_mb = var.vm_memory_mb
}
