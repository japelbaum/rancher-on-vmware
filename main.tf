locals {
  vm_ssh_key = file(var.vm_ssh_key)
}
module "nodes" {
  source             = "./modules/nodes"
  vsphere_server     = var.vsphere_server
  vsphere_user       = var.vsphere_user
  vsphere_password   = var.vsphere_password
  vsphere_datacenter = var.vsphere_datacenter
  vsphere_cluster    = var.vsphere_cluster
  vsphere_network    = var.vsphere_network

  vm_prefix     = var.vm_prefix
  vm_count      = var.vm_count
  vm_datastore  = var.vm_datastore
  vm_cpucount   = var.vm_cpucount
  vm_memory     = var.vm_memory
  vm_domainname = var.vm_domainname
  vm_network    = var.vm_network
  vm_netmask    = var.vm_netmask
  vm_gateway    = var.vm_gateway
  vm_dns        = var.vm_dns
  vm_template   = var.vm_template



  lb_address    = var.lb_address
  lb_prefix     = var.lb_prefix
  lb_datastore  = var.lb_datastore
  lb_cpucount   = var.lb_cpucount
  lb_memory     = var.lb_memory
  lb_domainname = var.lb_domainname
  lb_netmask    = var.lb_netmask
  lb_gateway    = var.lb_gateway
  lb_dns        = var.lb_dns

  vm_ssh_key = local.vm_ssh_key
  vm_ssh_user = var.vm_ssh_user
  
  reg_key = var.reg_key
  reg_email = var.reg_email
}

module "rke" {
  source     = "./modules/rke"
  vm_count   = var.vm_count
  vm_address = "${module.nodes.instance_ip_addr}"
  ssh_user = var.vm_ssh_user
  ssh_key = local.vm_ssh_key
  
  depends_on = [module.nodes]

}

module "rancher-admin" {
  source              = "./modules/rancher-admin"
  
  certmanager_version = var.certmanager_version
  rancher_hostname    = var.rancher_hostname
  rancher_version     = var.rancher_version

  depends_on = [module.rke]
}

module "rancher-bootstrap" {
  
  source = "./modules/rancher-bootstrap"  
  rancher_hostname = var.rancher_hostname
  providers = {
    rancher2 = rancher2.bootstrap
  }
  depends_on = [module.rancher-admin]
}

  data "vault_generic_secret" "rancherapitoken" {
  path = "secret/rancherapitoken" 
  depends_on = [module.rancher-bootstrap]
}


module "rancher-cloudprovider" {
  source = "./modules/rancher-cloudprovider"
    vsphere_user = var.vsphere_user
    vsphere_password = var.vsphere_password
    vsphere_server = var.vsphere_server
    vsphere_resourcepool = var.vsphere_resourcepool
    vsphere_datastore = var.vsphere_datastore
    vsphere_datastore_folder = var.vsphere_datastore_folder
    vsphere_datacenter = var.vsphere_datacenter

    vsphere_nodetemplate_host = var.vsphere_nodetemplate_host
    vsphere_nodetemplate_cpucount = var.vsphere_nodetemplate_cpucount
    vsphere_nodetemplate_memory = var.vsphere_nodetemplate_memory
    vsphere_nodetemplate_disksize = var.vsphere_nodetemplate_disksize
    vsphere_nodetemplate_creationtype = var.vsphere_nodetemplate_creationtype
    vsphere_nodetemplate_clonefrom = var.vsphere_nodetemplate_clonefrom
    providers = {
    rancher2 = rancher2.admin
  }
    depends_on = [module.rancher-admin]
}

module "rancher-tenant" {
  source = "./modules/tenant"
  vsphere_nodetemplate_id = module.rancher-cloudprovider.node_template_id
   providers = {
    rancher2 = rancher2.admin
  }
  depends_on = [module.rancher-cloudprovider]
}
/* resource "null_resource" "wait_for_rancher" {
  provisioner "local-exec" {
    command = <<EOF
    while true; do curl -kv https://"${var.rancher_hostname}" 2>&1 | grep -q "dynamiclistener-ca"; if [ $? != 0 ]; then echo "Rancher URL isn't ready yet"; sleep 5; continue; fi; break; done; echo "Rancher URL is Ready";
              EOF
  }

  depends_on = [module.rancher]
}
 */





