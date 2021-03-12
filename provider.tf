 
provider "vault" {
 address = "https://hvp.akeyless.io"
}

provider "rancher2" {
  alias = "bootstrap"
  api_url = "https://rancher.msp-rancher.lab"
  bootstrap = true
  insecure = true
  
}

provider "rancher2" {
  alias = "admin"
  api_url = "https://rancher.msp-rancher.lab"
  token_key = "${data.vault_generic_secret.rancherapitoken.data["rancherapitoken"]}" 
  insecure = true
  //depends_on = dat.vault_generic_secret.rancherapitoken
}
provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}
provider "helm" {
  kubernetes {
    config_path = "./kube_config_cluster.yml"
  }
}
provider "kubernetes" {
  config_path = "./kube_config_cluster.yml"
}