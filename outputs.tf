output "resource_group_name" {
  value = azurerm_resource_group.aks_rg.name
  description = "The name of the resource group"
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.app.name
  description = "The name of the AKS cluster"
}

output "host" {
  value = azurerm_kubernetes_cluster.app.kube_config.0.host
  description = "The Kubernetes cluster server host"
  sensitive = true
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.app.kube_config.0.client_certificate
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster"
  sensitive = true
}

output "client_key" {
  value = azurerm_kubernetes_cluster.app.kube_config.0.client_key
  description = "Base64 encoded private key used by clients to authenticate to the Kubernetes cluster"
  sensitive = true
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.app.kube_config.0.cluster_ca_certificate
  description = "Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster"
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.app.kube_config_raw
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools"
  sensitive = true
}

output "kubernetes_cluster_id" {
  value = azurerm_kubernetes_cluster.app.id
  description = "The Kubernetes cluster ID"
}