resource "rancher2_cluster" "tenant-cluster" {
  
  name = "tenant-cluster"
  description = "Cluster for tenant"
  rke_config {
    network {
      plugin = "canal"
    }
  }
}

resource "rancher2_node_pool" "rancher-pool" {
  
  cluster_id =  rancher2_cluster.tenant-cluster.id
  name = "rancher-tenant-pool"
  hostname_prefix =  "rancher-tenant-node-0"
  node_template_id = var.vsphere_nodetemplate_id
  quantity = 1
  control_plane = true
  etcd = true
  worker = true
}