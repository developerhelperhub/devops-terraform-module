variable "kubernetes_namespace" {
  type        = string
  description = "Namepace of kubernetes the service need to install"
}

variable "jenkins_enable" {
  type        = bool
  description = "Enable the installation of Jenkins"
  default = true
}

variable "service_port" {
  type        = number
  description = "Service port"
  default     = 8080
}

variable "domain_name" {
  type        = string
  description = "Domain name"
}

variable "admin_username" {
  type        = string
  description = "Admin username"
}

variable "admin_password" {
  type        = string
  description = "Admin password"
}
