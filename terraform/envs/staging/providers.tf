terraform {
  required_version = ">= 1.4.0"
  required_providers {
    kind   = { source = "tehcyx/kind", version = "~> 0.6" }
    docker = { source = "kreuzwerker/docker", version = "~> 3.0" }
  }
}
