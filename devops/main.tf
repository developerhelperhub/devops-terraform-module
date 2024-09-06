#Installing the cluster in Docker
module "kind_cluster" {
  source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/kind?ref=dev"

  name       = var.kind_cluster_name
  http_port  = 80
  https_port = 443
}

#Configuring the kubenretes provider based on the cluster information
provider "kubernetes" {

  host                   = module.kind_cluster.endpoint
  client_certificate     = module.kind_cluster.client_certificate
  client_key             = module.kind_cluster.client_key
  cluster_ca_certificate = module.kind_cluster.cluster_ca_certificate
}

#Installing the ingress controller in the cluster, this ingress support by kind. This ingress controller will be different based on the clusters such as AWS, Azure, Etc.
module "kind_ingress" {
  source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/kind/ingress?ref=dev"

  kube_endpoint               = module.kind_cluster.endpoint
  kube_client_key             = module.kind_cluster.client_key
  kube_client_certificate     = module.kind_cluster.client_certificate
  kube_cluster_ca_certificate = module.kind_cluster.cluster_ca_certificate

  depends_on = [module.kind_cluster]
}

#Configuring the helm provider based on the cluster information
provider "helm" {
  kubernetes {
    host                   = module.kind_cluster.endpoint
    client_certificate     = module.kind_cluster.client_certificate
    client_key             = module.kind_cluster.client_key
    cluster_ca_certificate = module.kind_cluster.cluster_ca_certificate
  }
}

#Installing the namespace in the Kuberenetes cluster
module "kubernetes_namespace" {
  source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/kubernetes/namespace?ref=dev"

  namespace_name = var.kubernetes_namespace

  depends_on = [module.kind_ingress]
}

#Instaling the jenkins
module "jenkins" {
  source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/jenkins?ref=dev"

  jenkins_enable       = var.jenkins_enable
  kubernetes_namespace = module.kubernetes_namespace.namespace
  service_port         = var.jenkins_service_port
  domain_name          = var.jenkins_domain_name
  admin_username       = var.jenkins_admin_username
  admin_password       = var.jenkins_admin_password

  depends_on = [module.kubernetes_namespace]
}

#Instaling the jfrog artifactory oss
module "jfrog_artifactory_oss" {
  source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/jfrog?ref=dev"

  jfrog_enable         = var.jfrog_enable
  kubernetes_namespace = module.kubernetes_namespace.namespace
  service_port         = var.jfrog_service_port
  domain_name          = var.jfrog_domain_name
  postgresql_password  = var.jfrog_postgresql_password

  depends_on = [module.kubernetes_namespace]
}

module "jenkins_agent_maven_config" {
   source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/jenkins/maven-agent-config?ref=dev"

   jenkins_agent_maven_config_enabled = var.jenkins_agent_maven_config_enabled
   namespace = var.kubernetes_namespace
   reclaim_policy = var.jenkins_agent_maven_config_reclaim_policy
   storage_class  = var.jenkins_agent_maven_config_storage_class
   pvc_storage_size  = var.jenkins_agent_maven_config_pvc_storage_size
   pv_storage_size  = var.jenkins_agent_maven_config_pv_storage_size
   pv_storage_source_host_path  = var.jenkins_agent_maven_config_pv_storage_source_host_path

   depends_on = [module.kubernetes_namespace]
}

#Instaling the kube-prometheus-stack
module "kube_prometheus_stack" {
  source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/kube-prometheus-stack?ref=dev"

  kube_prometheus_stack_enable = var.kube_prometheus_stack_enable
  kubernetes_namespace         = module.kubernetes_namespace.namespace

  prometheus_service_port = var.prometheus_service_port
  prometheus_domain_name  = var.prometheus_domain_name

  grafana_domain_name    = var.grafana_domain_name
  grafana_service_port   = var.grafana_service_port
  grafana_admin_password = var.grafana_admin_password

  alertmanager_enabled      = var.prometheus_alertmanager_enabled
  persistent_volume_enabled = var.prometheus_persistent_volume_enabled
  persistent_volume_size    = var.prometheus_persistent_volume_size

  depends_on = [module.kubernetes_namespace]
}
