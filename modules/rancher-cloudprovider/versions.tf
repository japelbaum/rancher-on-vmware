terraform {
  required_providers {
  rancher2 = {
      source  = "rancher/rancher2"
      version = "1.11.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.0.0"
    }
 }
  required_version = ">= 0.13"
}
