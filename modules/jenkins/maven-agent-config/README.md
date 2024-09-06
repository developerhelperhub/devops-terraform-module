We are using YAML template encode to map the variables to YAML file. We are using the local-exec to run the process background because this resoure will be waiting to create first agent pod and binding to storage, this dyanmic approach to create storage. we don't need to be allocted the storage without pod. 

The retention policy default is Retain