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
  default = "jenkins-agent-maven-repo-local-storage"
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
  default = "/mnt/data/jenkins/agent-maven-repo"
}