# -------------- Common ----------------
variable "devops_service_passwords" {
  type = map(object({
    length  = number
    special = bool
    upper   = bool
    lower   = bool
  }))

  default = {
    "jenkins_password"         = { length = 20, special = true, upper = true, lower = true },
    "jfrog_postgress_password" = { length = 12, special = true, upper = true, lower = true },
    "grafana_password"         = { length = 16, special = true, upper = true, lower = true }
  }
}


# -------------- Cluster ----------------
variable "kind_cluster_name" {
  type        = string
  description = "Kind cluster name"
}

variable "kind_http_port" {
  type        = number
  description = "Kind cluster http expose port"
  default     = 80
}

variable "kind_https_port" {
  type        = number
  description = "Kind cluster https expose port"
  default     = 443
}

# -------------- Kubernetes Namespace ----------------

variable "kubernetes_namespace" {
  type        = string
  description = "Resources are installing in the Kubernetes namespace"
}

# -------------- Jenkins ----------------

variable "jenkins_enable" {
  type        = bool
  description = "Enable the installation of Jenkins"
  default     = true
}

variable "jenkins_service_port" {
  type        = number
  description = "Jenklins service port"
  default     = 8080
}

variable "jenkins_domain_name" {
  type        = string
  description = "Jenkins domain name"
}

variable "jenkins_admin_username" {
  type        = string
  description = "Jenkins admin username"
}

variable "jenkins_admin_password" {
  type        = string
  description = "Jenkins admin password"
  default = "AUTO_GENERATED"
}

# -------------- Jfrog ----------------

variable "jfrog_enable" {
  type        = bool
  description = "Enable the installation of Jfrog"
  default     = false
}

variable "jfrog_service_port" {
  type        = number
  description = "Jfrog service port"
  default     = 8082
}

variable "jfrog_domain_name" {
  type        = string
  description = "Jfrog domain name"
}

variable "jfrog_postgresql_password" {
  type        = string
  description = "Jfrog Postgresql password"
  default = "AUTO_GENERATED"
}

# -------------- Jenkins Maven Configuration ----------------

variable "jenkins_agent_maven_config_enabled" {
  type        = bool
  description = "Whether jenkins maven configuration enabled / disabled"
  default     = false
}

variable "jenkins_agent_maven_config_storage_class" {
  type        = string
  description = "Storage class name"
  default = "standard"
}

variable "jenkins_agent_maven_config_reclaim_policy" {
  type        = string
  description = "Relaim policy type default is Delete"
  default     = "Retain"
}

variable "jenkins_agent_maven_config_pvc_storage_size" {
  type        = string
  description = "Presistance volume cliame storage size"
}

variable "jenkins_agent_maven_config_pv_storage_size" {
  type        = string
  description = "Presistance volume storage size"
}


variable "jenkins_agent_maven_config_pv_storage_source_host_path" {
  type        = string
  description = "Presistance volume source host path"
  default     = "/mnt/data/jenkins-agent-maven-repo"
}


variable "jenkins_agent_maven_config_app_repository_id" {
  type        = string
  description = "Application artifactory repository id"
  default = "NotSet"
}

variable "jenkins_agent_maven_config_app_repository_url" {
  type        = string
  description = "Application artifactory repository url"
  default = "NotSet"
}

variable "jenkins_agent_maven_config_app_repository_username" {
  type        = string
  description = "Application artifactory repository username"
  default = "NotSet"
  sensitive = true
}

variable "jenkins_agent_maven_config_app_repository_password" {
  type        = string
  description = "Application artifactory repository password"
  default = "NotSet"
  sensitive = true
}

variable "jenkins_agent_maven_config_app_central_repository_id" {
  type        = string
  description = "Application central artifactory repository id"
  default = "NotSet"
}

variable "jenkins_agent_maven_config_app_central_repository_url" {
  type        = string
  description = "Application central artifactory repository url"
  default = "NotSet"
}

variable "jenkins_agent_maven_config_app_central_repository_username" {
  type        = string
  description = "Application central artifactory repository username"
  default = "NotSet"
  sensitive = true
}

variable "jenkins_agent_maven_config_app_central_repository_password" {
  type        = string
  description = "Application central artifactory repository password"
  default = "NotSet"
  sensitive = true
}

variable "jenkins_agent_maven_config_maven_master_password" {
  type        = string
  description = "Maven master password"
  default = "NotSet"
  sensitive = true
}

# -------------- Kube Prometheus Stack ----------------

variable "kube_prometheus_stack_enable" {
  type        = bool
  description = "Enable the installation of Jfrog"
  default     = false
}

variable "prometheus_service_port" {
  type        = number
  description = "Prometheus service port"
  default     = 80
}

variable "prometheus_domain_name" {
  type        = string
  description = "Prometheus domain name"
}

variable "grafana_service_port" {
  type        = number
  description = "Grafana Service port"
  default     = 80
}

variable "grafana_domain_name" {
  type        = string
  description = "Grafana Domain name"
}

variable "grafana_admin_password" {
  type        = string
  description = "Grafana admin password"
  default = "AUTO_GENERATED"
}

variable "prometheus_alertmanager_enabled" {
  type        = bool
  description = "Prometheus alertmanager whether enabled / desabled, default is enabled"
  default     = true
}

variable "prometheus_persistent_volume_enabled" {
  type        = bool
  description = "Prometheus volume whether enabled / desabled, default is enabled"
  default     = true
}

variable "prometheus_persistent_volume_size" {
  type        = string
  description = "Prometheus volume whether enabled / desabled, default size is 1Gi"
  default     = "1Gi"
}

