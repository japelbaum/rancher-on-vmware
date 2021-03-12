resource rke_cluster "cluster" {
cluster_name = "cluster"
  dynamic "nodes" {

    for_each = var.vm_address

    content {
      user = var.ssh_user 
      address = nodes.value
      internal_address = nodes.value
      role    = ["controlplane", "worker", "etcd"]
      ssh_key = file("C:/Users/IHV-USER/.ssh/id_rsa")
    }

  }

}


resource "local_file" "kube_cluster_yaml" {
  filename = "${path.root}/kube_config_cluster.yml"
  content  = rke_cluster.cluster.kube_config_yaml
}

