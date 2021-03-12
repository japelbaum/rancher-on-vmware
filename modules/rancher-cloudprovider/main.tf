

resource "rancher2_cloud_credential" "vspherecreds" {
  
  name = "vspherecreds"
  description = "vsphere credentials"
  vsphere_credential_config {
    username = var.vsphere_user
    password = var.vsphere_password
    vcenter = var.vsphere_server
  }
}
resource "rancher2_node_template" "rke-template" {
  
  name = "rke-node"
  description = "rke node template"
  cloud_credential_id = rancher2_cloud_credential.vspherecreds.id
  vsphere_config {
   datacenter = var.vsphere_datacenter
   pool = var.vsphere_resourcepool
   datastore = var.vsphere_datastore
   folder = var.vsphere_datastore_folder
   hostsystem = var.vsphere_nodetemplate_host
   cpu_count = var.vsphere_nodetemplate_cpucount
   memory_size = var.vsphere_nodetemplate_memory
   disk_size = var.vsphere_nodetemplate_disksize
   creation_type = var.vsphere_nodetemplate_creationtype
   clone_from = var.vsphere_nodetemplate_clonefrom
   cfgparam = var.vsphere_nodetemplate_cfgparam
  }
}