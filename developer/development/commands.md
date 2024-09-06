terraform init
terraform init -upgrade

terraform workspace new development
terraform workspace select development

terraform plan
terraform apply  -var="kind_cluster_name=devops-development-cluster"
terraform apply  -var="kind_cluster_name=devops-development-cluster"
terraform destroy -var="kind_cluster_name=devops-development-cluster"

chmod +x terraform-clean.sh
./terraform-clean.sh


docker run -it --name test-module-version-envornment-box -v ~/.kube/config:/work/.kube/config -e KUBECONFIG=/work/.kube/config -v ${HOME}:/root/ -v ${PWD}:/work -w /work --net host developerhelperhub/kub-terr-work-env-box