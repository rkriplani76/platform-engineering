variable "resource_group_name" {
  description = "Name of the Azure resource group for the AKS cluster."
  type        = string
  default     = "rg-aks-learn"
}

variable "location" {
  description = "Azure region where the cluster will be deployed."
  type        = string
  default     = "eastus"
}

variable "cluster_name" {
  description = "Name of the AKS cluster."
  type        = string
  default     = "aks-learn"
}

variable "node_count" {
  description = "Number of nodes in the default system node pool."
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "VM size for each AKS node."
  type        = string
  default     = "Standard_B2s"
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB for each node."
  type        = number
  default     = 30
}

variable "admin_username" {
  description = "Admin username for the Linux nodes."
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "SSH public key used to access the cluster nodes."
  type        = string
  default     = ""
}

variable "kubernetes_version" {
  description = "Optional Kubernetes version override. Leave blank to use the default AKS version."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the created resources."
  type        = map(string)
  default = {
    environment = "learning"
    workload    = "aks"
  }
}
