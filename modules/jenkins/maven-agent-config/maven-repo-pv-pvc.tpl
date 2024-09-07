apiVersion: v1
kind: PersistentVolume
metadata:
  name: jenkins-agent-maven-repo-pv
  namespace: ${namespace}
spec:
  capacity:
    storage: ${pv_storage_size}
  accessModes:
    - ReadWriteMany
  persistentVolumeReclaimPolicy: ${reclaim_policy}
  storageClassName: ${storage_class}
  hostPath:
    path: ${pv_storage_source_host_path}
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: jenkins-agent-maven-repo-pvc
  namespace: ${namespace}
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: ${storage_class}
  resources:
    requests:
      storage: ${pvc_storage_size}
