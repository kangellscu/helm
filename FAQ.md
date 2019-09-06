## 在container内部，无法通过service访问自己
* 详细描述
If a pod has a service which points to the pod, the pod cannot reach itself through the 
service IP. Other pods can reach the service and the pod itself can reach other services.

* 出现场景
在minikube中发现，通过查阅资料，与k8s版本有关

* How to fixed
```shell
minikube ssh
ip link set docker0 promisc on
```
