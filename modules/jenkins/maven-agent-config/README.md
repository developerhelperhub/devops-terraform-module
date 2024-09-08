## Maven Presistance Storage for Maven Repository
We are using YAML template encode to map the variables to YAML file and alsi using the local-exec to run the process background it because this resoure will be waiting to create first agent pod and binding to storage, this dyanmic approach to create storage. we don't need to be allocted the storage without pod. 

The retention policy default is Retain

Verify the maven storage resources
```shell
kubectl -n devops get pv
kubectl -n devops get pvc
kubectl -n devops get storageclass
```
Outputs: 
```shell
kubectl -n devops get pv
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM            STORAGECLASS                             REASON   AGE
jenkins-agent-maven-repo-pv                5Gi        RWX            Retain           Available                    jenkins-agent-maven-repo-local-storage            8m28s
pvc-9fcb101f-796a-40ec-87d4-2081be355edf   8Gi        RWO            Delete           Bound       devops/jenkins   standard                                          2m35s

kubectl -n devops get pvc
NAME                           STATUS    VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS                             AGE
jenkins                        Bound     pvc-9fcb101f-796a-40ec-87d4-2081be355edf   8Gi        RWO            standard                                 2m39s
jenkins-agent-maven-repo-pvc   Pending                                                                        jenkins-agent-maven-repo-local-storage   8m28s

kubectl -n devops get storageclass
NAME                                     PROVISIONER             RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
jenkins-agent-maven-repo-local-storage   rancher.io/local-path   Delete          WaitForFirstConsumer   false                  8m29s
standard (default)                       rancher.io/local-path   Delete          WaitForFirstConsumer   false                  17h
```

## Destroy maven config
```shell
terraform destroy -target=module.devops.module.jenkins_agent_maven_config  -var="kind_cluster_name=devops-development-cluster"
```