## Maven repository persistance storage testing
```shell
kubectl -n devops apply -f test/jenkins-agent-maven-config/maven-repo-pv-pvc.yaml
kubectl -n devops get pv
kubectl -n devops get pvc
kubectl -n devops get storageclass

kubectl -n devops delete -f test/jenkins-agent-maven-config/maven-repo-pv-pvc.yaml
```

## Maven settings and security debuging commands
```shell
kubectl -n devops get configmap jenkins-agent-maven-settings
kubectl -n devops get secret jenkins-agent-maven-credentials


kubectl -n devops delete configmap jenkins-agent-maven-settings
kubectl -n devops delete secret jenkins-agent-maven-credentials

kubectl -n devops delete -f test/jenkins-agent-maven-config/graalvm-22-muslib-maven-jenkins-agent-template.yaml
kubectl -n devops apply -f test/jenkins-agent-maven-config/graalvm-22-muslib-maven-jenkins-agent-template.yaml
kubectl -n devops get pod graalvm-22-muslib-maven-jenkins-agent-template
kubectl -n devops exec -it graalvm-22-muslib-maven-jenkins-agent-template -c builder -- sh
```