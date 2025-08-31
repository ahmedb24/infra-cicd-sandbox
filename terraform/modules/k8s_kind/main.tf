resource "kind_cluster" "this" {
  name       = var.name
  node_image = var.node_image

  dynamic "kind_config" {
    for_each = var.config == null ? [] : [1]
    content {
      kind        = var.config.kind
      api_version = var.config.api_version # Possible value: "kind.x-k8s.io/v1alpha4"
    }
  }
}
