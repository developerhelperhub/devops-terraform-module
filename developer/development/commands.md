```shell
terraform init
terraform init -upgrade

terraform workspace new development
terraform workspace select development

terraform plan -var="kind_cluster_name=devops-development-cluster"
terraform apply  -var="kind_cluster_name=devops-development-cluster"
terraform destroy -var="kind_cluster_name=devops-development-cluster"
```

```shell
chmod +x terraform-clean.sh
./terraform-clean.sh
```

Replace fast-storage with the actual name of the storage class available in your Kubernetes cluster.
If you're unsure which storage classes are available, you can list them using:
```shell
kubectl get storageclass
```
This will show you the available storage classes, which you can reference in your Terraform configuration.