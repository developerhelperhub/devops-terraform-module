variable "jenkins_agent_maven_config_enabled" {
  type        = bool
  description = "Whether jenkins maven configuration enabled / disabled"
  default = false
}

variable "namespace" {
  type        = string
  description = "Namespace where to create the resource"
}

variable "storage_class" {
  type        = string
  description = "Storage class name"
  default = "standard"
}

variable "reclaim_policy" {
  type        = string
  description = "Relaim policy type default is Delete"
  default = "Retain"
}

variable "pvc_storage_size" {
  type        = string
  description = "Presistance volume cliame storage size"
}

variable "pv_storage_size" {
  type        = string
  description = "Presistance volume storage size"
}


variable "pv_storage_source_host_path" {
  type        = string
  description = "Presistance volume source host path"
  default = "/mnt/data/jenkins-agent-maven-repo"
}

variable "app_repository_id" {
  type        = string
  description = "Application artifactory repository id"
  default = "NotSet"
}

variable "app_repository_url" {
  type        = string
  description = "Application artifactory repository url"
  default = "NotSet"
}

variable "app_repository_username" {
  type        = string
  description = "Application artifactory repository username"
  default = "NotSet"
  sensitive = true
}

variable "app_repository_password" {
  type        = string
  description = "Application artifactory repository password"
  default = "NotSet"
  sensitive = true
}

variable "app_central_repository_id" {
  type        = string
  description = "Application central artifactory repository id"
  default = "NotSet"
}

variable "app_central_repository_url" {
  type        = string
  description = "Application central artifactory repository url"
  default = "NotSet"
}

variable "app_central_repository_username" {
  type        = string
  description = "Application central artifactory repository username"
  default = "NotSet"
  sensitive = true
}

variable "app_central_repository_password" {
  type        = string
  description = "Application central artifactory repository password"
  default = "NotSet"
  sensitive = true
}

variable "maven_master_password" {
  type        = string
  description = "Maven master password"
  default = "NotSet"
  sensitive = true
}