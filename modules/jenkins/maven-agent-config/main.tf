resource "local_file" "jenkins_agent_maven_repo_config_local_file" {

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

resource "null_resource" "jenkins_agent_maven_config" {

  count = var.jenkins_agent_maven_config_enabled ? 1 : 0

  provisioner "local-exec" {
    command = "kubectl apply -f ${local_file.jenkins_agent_maven_repo_config_local_file[0].filename}"
  }

  # Ensure the YAML file is created before executing the kubectl apply
  depends_on = [local_file.jenkins_agent_maven_repo_config_local_file[0]]
}


resource "local_file" "jenkins_agent_maven_setting_config_local_file" {

  count = var.jenkins_agent_maven_config_enabled ? 1 : 0

  filename = "${path.module}/settings.xml"
  content = templatefile("${path.module}/settings.xml.tpl", {
    app_repository_id               = var.app_repository_id
    app_repository_url              = var.app_repository_url
    app_repository_username         = var.app_repository_username
    app_repository_password         = var.app_repository_password
    app_central_repository_id       = var.app_central_repository_id
    app_central_repository_url      = var.app_central_repository_url
    app_central_repository_username = var.app_central_repository_username
    app_central_repository_password = var.app_central_repository_password

  })
}

resource "null_resource" "jenkins_agent_maven_setting_config" {

  count = var.jenkins_agent_maven_config_enabled ? 1 : 0

  provisioner "local-exec" {
    #kubectl -n devops create configmap maven-settings --from-file=settings.xml
    command = "kubectl -n ${var.namespace} create configmap jenkins-agent-maven-settings --from-file=${local_file.jenkins_agent_maven_setting_config_local_file[0].filename}"
  }

  # Ensure the YAML file is created before executing the kubectl apply
  depends_on = [local_file.jenkins_agent_maven_setting_config_local_file[0]]
}

resource "local_file" "jenkins_agent_maven_setting_security_config_local_file" {

  count = var.jenkins_agent_maven_config_enabled ? 1 : 0

  filename = "${path.module}/settings-security.xml"
  content = templatefile("${path.module}/settings-security.xml.tpl", {
    maven_master_password = var.maven_master_password
  })
}

resource "null_resource" "jenkins_agent_maven_setting_security_config" {

  count = var.jenkins_agent_maven_config_enabled ? 1 : 0

  provisioner "local-exec" {
    #kubectl -n devops create secret generic maven-credentials --from-file=settings-security.xml
    command = "kubectl -n ${var.namespace} create secret generic jenkins-agent-maven-credentials --from-file=${local_file.jenkins_agent_maven_setting_security_config_local_file[0].filename}"
  }

  # Ensure the YAML file is created before executing the kubectl apply
  depends_on = [local_file.jenkins_agent_maven_setting_security_config_local_file[0]]
}