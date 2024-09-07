kubectl -n devops apply -f test/jenkins-agent-maven-config/maven-repo-pv-pvc.yaml
kubectl -n devops get pv
kubectl -n devops get pvc
kubectl -n devops get storageclass

kubectl -n devops delete -f test/jenkins-agent-maven-config/maven-repo-pv-pvc.yaml

