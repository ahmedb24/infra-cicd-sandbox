terraform {
  required_version = ">= 1.4.0"
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.6"
    }
  }
}
