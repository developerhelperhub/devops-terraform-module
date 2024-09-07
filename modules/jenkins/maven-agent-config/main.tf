resource "local_file" "jenkins_agent_maven_config_local_file" {
  
  count = var.jenkins_agent_maven_config_enabled ? 1 : 0

  filename = "${path.module}/maven-repo-pv-pvc.yaml"
  content = templatefile("${path.module}/maven-repo-pv-pvc.tpl", {
    namespace                   = var.namespace
    reclaim_policy              = var.reclaim_policy
    storage_class               = var.storage_class
    pvc_storage_size            = var.pvc_storage_size
    pv_storage_size             = var.pv_storage_size
    pv_storage_source_host_path = var.pv_storage_source_host_path

  })
}
# Apply the generated YAML using local-exec provisioner
resource "null_resource" "jenkins_agent_maven_config" {
  
  count = var.jenkins_agent_maven_config_enabled ? 1 : 0

  provisioner "local-exec" {
    command = "kubectl apply -f ${local_file.jenkins_agent_maven_config_local_file[0].filename}"
  }

  # Ensure the YAML file is created before executing the kubectl apply
  depends_on = [local_file.jenkins_agent_maven_config_local_file[0]]
}
