# K3S

References:
- https://k3s.io/

K3S is a lightweight Kubernetes distribution. It is a single binary that can be installed on a Linux host. It is a great choice for single node (single server or laptop) Kubernetes clusters.

Before installation, please check the requirements: https://docs.k3s.io/installation/requirements, and then you can follow the instructions from https://docs.k3s.io/quick-start.

## Install K3S

Following instructions are taken from the k3s quick start guide.

```shell
curl -sfL https://get.k3s.io | sh -
```

K3S comes with a built-in `kubectl` binary. You can use it to interact with the cluster. Once the above installation is completed, you can run the following command to check the nodes in the cluster:

```shell    
kubectl get node
```
In some cases, you might see error like `WARN[0000] Unable to read /etc/rancher/k3s/k3s.yaml, please start server with ...` then run the following command to provide read access K3S's kube config file:
```shell
sudo chmod 600 /etc/rancher/k3s/k3s.yaml
```


## Restart K3S

If you need to restart K3S, you can run the following command:

```shell
sudo systemctl restart k3s
```