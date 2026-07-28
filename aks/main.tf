resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
  numeric = true
}

locals {
  cluster_name = var.cluster_name != "" ? var.cluster_name : "aks-learn-${random_string.suffix.result}"
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = local.cluster_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = lower(replace(local.cluster_name, "-", ""))
  kubernetes_version  = var.kubernetes_version != "" ? var.kubernetes_version : null
  sku_tier            = "Free"

  default_node_pool {
    name              = "system"
    node_count        = var.node_count
    vm_size           = var.vm_size
    os_disk_size_gb   = var.os_disk_size_gb
    auto_scaling_enabled = false
  }

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  tags = var.tags
}
