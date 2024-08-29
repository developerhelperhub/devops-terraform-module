# 00004 - **DevOps Module for Kubernetes Cluster**
This is terraform module repository to maintain the version DevOps related resources to install inside the Kubernetes cluster. 

**Following the resources and provider supports in this module in Version 1.0.0**

| Module                            | Description                                                                                                                                                                                                                                                                                                                                                 |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Setup the Kind                    | This module is used to manage Kind-related resources, providers and kind ingress controller script file. The Kind support version 1.27.1                                                                                                                                                                                                                    |
| Setup the Kind Ingress Controller | This module is used to manage Kind ingress controller resource and this resource installing by Kubernetes shell script command.                                                                                                                                                                                                                             |
| Setup the Helm provider           | This module is used to manage Helm-related resources and providers. The Helm support version 2.14 or above.                                                                                                                                                                                                                                                 |
| Setup the Kubernetes provider     | This module is used to manage Kubernetes-related resources, providers. The Kubernetes support version 2.31 or above                                                                                                                                                                                                                                         |
| Setup the Kubernetes Namespace    | This module is used to manage Kubernetes namespace-related resources, providers.                                                                                                                                                                                                                                                                            |
| Setup the Jenkins                 | This module is used to manage Jenkins-related resources, providers and Kubernetes ingress configuration. The Helm Jenkins support version 5.4.2.                                                                                                                                                                                                            |
| Setup the common module           | This module is used to manage the common resources and providers needed in the root and child modules of "devops." In this example, we are using the "random_password" resource to generate a password for Jenkins.                                                                                                                                         |
| Setup DevOps                      | This is the main module for managing all DevOps-related modules and includes the installation steps for services that need to be deployed on the Kubernetes cluster. In this example, we configure DevOps tools required for the application, such as Kind Cluster, Kind Ingress Controller, Kubernetes provider and namespace, Helm provider, and Jenkins. |

## Usage of DevOps Module 

We easily use to “devops” module to setup resources inside the Kubernetes cluster locally, this cluster create on docker container in our local machine.

`main.tf` terraform script
```shell
module "common" {
    source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/common?ref=v1.0.0"
}
module "devops" {
    source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//devops?ref=v1.0.1"
    kind_cluster_name = 'test-my-cluster'
    kind_http_port = 80
    kind_https_port = 443
    kubernetes_namespace = "devops"
    jenkins_service_port = 8080
    jenkins_domain_name = 'jenkins.devops.com'
    jenkins_admin_username = 'admin'
    jenkins_admin_password = module.common.random_password_16
}
```
## Usage of Kind Module

We easily use to “kind” module to setup create the cluster in docker container in our local machine

`main.tf` terraform script
```shell
#Installing the cluster in Docker
module "kind_cluster" {
    source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/kind?ref=v1.0.0"
    name = 'test-my-cluster'
    http_port = 80
    https_port = 443
}
```
## Usage of Kind Ingress Module

We easily use to “kind ingress” module to install ingress the controller in the Kind Kubernetes cluster.

`main.tf` terraform script
```shell
#Installing the ingress controller in the cluster, this ingress support by kind. This ingress controller will be different based on the clusters such as AWS, Azure, Etc.
module "kind_ingress" {
    source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/kind/ingress?ref=v1.0.0"
    kube_endpoint = module.kind_cluster.endpoint
    kube_client_key = module.kind_cluster.client_key
    kube_client_certificate = module.kind_cluster.client_certificate
    kube_cluster_ca_certificate = module.kind_cluster.cluster_ca_certificate
    depends_on = [module.kind_cluster]
}
```
## Usage of Helm Module

We easily use to “helm” module to configure helm provider

`main.tf` terraform script
```shell
#Configuring the helm provider based on the cluster information
provider "helm" {
    kubernetes {
        host                   = module.kind_cluster.endpoint
        client_certificate     = module.kind_cluster.client_certificate
        client_key             = module.kind_cluster.client_key
        cluster_ca_certificate = module.kind_cluster.cluster_ca_certificate
    }
}
```

## Usage of Kubernetes Module

We easily use to “kubernetes” module to configure Kubernetes provider

`main.tf` terraform script
```shell
#Configuring the kubenretes provider based on the cluster information
provider "kubernetes" {
    host                   = module.kind_cluster.endpoint
    client_certificate     = module.kind_cluster.client_certificate
    client_key             = module.kind_cluster.client_key
    cluster_ca_certificate = module.kind_cluster.cluster_ca_certificate
}
```
## Usage of Kubernetes Namespace Module

We easily use to “kubernetes namespace” module to create the namespace Kubernetes cluster.

`main.tf` terraform script
```shell
#Installing the namespace in the Kuberenetes cluster
module "kubernetes_namespace" {
    source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/kubernetes/namespace?ref=v1.0.0"
    namespace_name = 'devops'
    depends_on = [module.kind_ingress]
}
```

## Usage of Kubernetes Namespace Module

We easily use to “jenkins module to install the Jenkins inside Kubernetes namespace.

`main.tf` terraform script
```shell
#Instaling the jenkins
module "jenkins" {
    source = "git::https://github.com/developerhelperhub/devops-terraform-module.git//modules/jenkins?ref=v1.0.0"
    
    kubernetes_namespace = module.kubernetes_namespace.namespace
    service_port = 80
    domain_name = 'jenkins.devops.com'
    admin_username = 'admin'
    admin_password = 'admin'
    depends_on = [module.kubernetes_namespace]
}
```
