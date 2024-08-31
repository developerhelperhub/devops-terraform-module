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
  default = true
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
  #    sensitive = true 
}

# -------------- Jfrog ----------------

variable "jfrog_enable" {
  type        = bool
  description = "Enable the installation of Jfrog"
  default = false
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
}

# -------------- Kube Prometheus Stack ----------------

variable "kube_prometheus_stack_enable" {
  type        = bool
  description = "Enable the installation of Jfrog"
  default = false
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
