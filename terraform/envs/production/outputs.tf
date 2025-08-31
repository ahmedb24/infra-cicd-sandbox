output "network_outputs" {
  value = {
    vnet_id   = module.network.vnet_id
    subnet_id = module.network.subnet_id
    nsg_rules = module.network.nsg_rules
  }
}

output "k8s" {
  value = {
    cluster_name    = module.k8s.cluster_name
    kubeconfig_path = module.k8s.kubeconfig_path
  }
}

output "vm" {
  value = {
    name = module.vm.vm_name
    id   = module.vm.vm_id
  }
}
