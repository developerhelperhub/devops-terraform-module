module "devops" {
  source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//devops?ref=dev"

  kind_cluster_name = var.kind_cluster_name
  kind_http_port    = 80
  kind_https_port   = 443

  kubernetes_namespace = "devops"

  jenkins_enable         = true
  jenkins_domain_name    = var.jenkins_domain_name
  jenkins_admin_username = var.jenkins_admin_username
  jenkins_admin_password = "MyPassword12920"

  jfrog_enable              = true
  jfrog_domain_name         = var.jfrog_domain_name

  kube_prometheus_stack_enable = false
  prometheus_domain_name       = var.prometheus_domain_name

  grafana_domain_name    = var.grafana_domain_name

  prometheus_alertmanager_enabled      = true
  prometheus_persistent_volume_enabled = true
  prometheus_persistent_volume_size    = "1Gi"

  jenkins_agent_maven_config_enabled = true
  jenkins_agent_maven_config_pvc_storage_size = "10Gi"
  jenkins_agent_maven_config_pv_storage_size = "10Gi"
}
