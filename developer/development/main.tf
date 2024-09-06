module "common" {
  source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/common?ref=dev"
}

module "devops" {
  source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//devops?ref=dev"

  kind_cluster_name = var.kind_cluster_name
  kind_http_port    = 80
  kind_https_port   = 443

  kubernetes_namespace = "devops"

  jenkins_enable         = false
  jenkins_domain_name    = var.jenkins_domain_name
  jenkins_admin_username = var.jenkins_admin_username
  jenkins_admin_password = module.common.random_password_16

  jfrog_enable              = false
  jfrog_domain_name         = var.jfrog_domain_name
  jfrog_postgresql_password = module.common.random_password_16

  kube_prometheus_stack_enable = false
  prometheus_domain_name       = var.prometheus_domain_name

  grafana_domain_name    = var.grafana_domain_name
  grafana_admin_password = module.common.random_password_16

  prometheus_alertmanager_enabled      = true
  prometheus_persistent_volume_enabled = true
  prometheus_persistent_volume_size    = "1Gi"

  jenkins_agent_maven_config_enabled = true
  jenkins_agent_maven_config_pvc_storage_size = "10Gi"
  jenkins_agent_maven_config_pv_storage_size = "5Gi"
}
