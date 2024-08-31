variable "kubernetes_namespace" {
  type        = string
  description = "Namepace of kubernetes the service need to install"
}

variable "jfrog_enable" {
  type        = bool
  description = "Enable the installation of Jfrog"
  default = false
}

variable "service_port" {
  type        = number
  description = "Service port"
  default     = 8082
}

variable "postgresql_password" {
  type        = string
  description = "Postgresql password"
}

variable "domain_name" {
  type        = string
  description = "Domain name"
}
