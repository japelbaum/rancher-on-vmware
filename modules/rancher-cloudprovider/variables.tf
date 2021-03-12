variable vsphere_server {
  type        = string
  description = "FQDN or IP address of vCenter instance"
}

variable vsphere_user {
  type        = string
  description = "Username for the vCenter instance"
}

variable vsphere_password {
  type        = string
  description = "Password for the vCenter instance"
}


variable vsphere_datacenter {
  type        = string
  description = "vsphere datacenter to use"
}

variable vsphere_resourcepool{
  type        = string
  description = "vsphere resourcepool to use"
}

variable vsphere_datastore{
  type        = string
  description = "Sphere datastore for docker VM "
}
variable vsphere_nodetemplate_host{
  type        = string
  description = "Sphere compute resource where the docker VM will be instantiated. This can be omitted if using a cluster with DRS (string)"
  default = ""
}

variable vsphere_datastore_folder{
  type        = string
  description = "folder on the datastore where to place the vms"
  default = ""
}

variable vsphere_nodetemplate_cpucount{
  type        = string
  description = "vSphere CPU number for docker VM."
  default = "2"
}
variable vsphere_nodetemplate_memory{
  type        = string
  description = "vSphere size of memory for docker VM (in MB)."
  default = "2048"
}

variable vsphere_nodetemplate_disksize{
  type        = string
  description = "vSphere size of disk for docker VM (in MB)."
  default = "20480"
}

variable vsphere_nodetemplate_creationtype{
  type        = string
  description = "Creation type when creating a new virtual machine. Supported values: vm, template, library, legacy. "
}

variable vsphere_nodetemplate_clonefrom{
  type        = string
  description = "Creation type when creating a new virtual machine. Supported values: vm, template, library, legacy. "
}

variable vsphere_nodetemplate_cfgparam{
  type        = list
  description = " vSphere vm configuration parameters (used for guestinfo) "
  default = ["disk.enableUUID=TRUE"]
}
