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
  description = "Name of the vCenter Datacenter object"
}

variable vsphere_cluster {
  type        = string
  description = "Name of the vCenter Cluster object"
}

variable vsphere_network {
  type        = string
  description = "Name of the vDS/vSS Port Group to attach to the VM's"
}

variable vm_prefix {
  type        = string
  description = "Name prefix for VM's. A numerical value will be appended"
}

variable vm_count {
  type        = number
  description = "Number of RKE instances to create"
}

variable vm_datastore {
  type        = string
  description = "Name of the vCenter datastore object"
}

variable vm_cpucount {
  type        = number
  description = "Number of vCPU's to assign to the VM's"
}

variable vm_memory {
  type        = number
  description = "Amount of memory (in MB) to assign to the VM's"
}

variable vm_domainname {
  type        = string
  description = "Domain name suffix for the VM"
}

variable vm_network {
  type        = string
  description = "CIDR network to use with appended . IE - 172.16.10."
}

variable vm_netmask {
  type        = string
  description = "Subnet Mask length for VM's"
}

variable vm_gateway {
  type        = string
  description = "Gateway address for VM"
}

variable vm_dns {
  type        = string
  description = "IP address of DNS server"
}

variable vm_template {
  type        = string
  description = "Name of VM template to use"
}

variable lb_address {
  type        = string
  description = "IP address for the NGINX loadbalancer"
}

variable lb_prefix {
  type        = string
  description = "Name prefix for the Loadbalancer"
}

variable lb_datastore {
  type        = string
  description = "Datastore object to store the Loadbalancer VM"
}

variable lb_cpucount {
  type        = number
  description = "Number of CPU's to assign to the Loadbalancer VM"
}

variable lb_memory {
  type        = number
  description = "Amount of RAM in MB to assign to the Loadbalancer VM"
}

variable lb_domainname {
  type        = string
  description = "Domain name suffix for the VM"
}

variable lb_netmask {
  type        = string
  description = "Subnet mask for the Loadbalancer VM"
}

variable lb_gateway {
  type        = string
  description = "Gateway for the Loadbalancer VM"
}

variable lb_dns {
  type        = string
  description = "DNS Server for the Loadbalancer VM"
}

variable certmanager_version {
  type        = string
  description = "Version of Certmanager to install"
}

variable rancher_hostname {
  type        = string
  description = "Name for the Rancher host"
}

variable rancher_version {
  type        = string
  description = "Version of Rancher to install"
}

variable vm_ssh_key {
  type        = string
  description = "SSH key to add to the cloud-init for user access"
}

variable vm_ssh_user {
  type        = string
  description = "Username for ssh access"
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

variable reg_key{
  type        = string
  description = "Registration key for activating SLES"
 
}

variable reg_email{
  type        = string
  description = "Email for activating SLES"
}

