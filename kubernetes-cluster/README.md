# Learning Kubernetes

Set up a production-like kubernetes (k8s) cluster using Vagrant vms.

## Setup

To control the names of the clusters, set env variables `MASTER_NAME` and `WORKER_NAME` (optional).

Or use a `.env` file with the variables set in the file

## Notes

Kubernetes https://kubernetes.io/
  - automates the deploy, scaling, and managing of containerized apps

### Terms

Term | Definition
---- | ----------
Container | a process that runs an app, can be co-located in a pod sharing an IP and resources but on different ports
Control Plain
  | uses the PLEG to match the clusters state to the desired state
  | maintains record of all Kubernetes objects and checks them in a loop continuously, correcting state if necessary
  | https://kubernetes.io/docs/concepts/#kubernetes-control-plane
Deployment
  | configuration that tells the cluster how to update and create instances of your app
  | recommended way of scaling and managing Pods
Deployment Controller | continuously monitors instances; if one goes down will try to bring back (self-healing)
Kubectl | Kubernetes CLI that uses the Kubernetes API to interact with cluster; it talks to the master node
Kubelet | agent that manages node and communicates with master
Kube-proxy | network proxy which reflects Kubernetes networking services on each node
Master | 3 processes running on one node in a cluster: kube-apiserver, kube-controller-manager, kube-scheduler
Minikube | small scale local deployment of Kubernetes, it's a VM you can run locally to spin up a cluster via a CLI
Node | worker machine (VM or physical) in a cluster, runs kubelet, kube-proxy, and a container runtime (like docker or rkt)
PLEG | Pod Lifecycle Event generator
Pod | group of one or more containers, atomic unit of a kubernetes platform.  runs on a node
Service
  | abstraction that defines a logical set of Pods and a policy to access them; lets you loosely couple pods
  |  services let your app receive traffic

### Misc
  Goals/Features
    -: containerization packages software to better serve 24/7 availability and frequent deploys
      -: fast and easy deploys with no downtime

  Kubernetes cluster has a master and nodes (workers)
    -: a node is a vm or physical machine running a Kubelet
    -: it should have container tools like 'Docker' or 'rkt'
      -: why should? they don't by default?
    -: a production cluster should be a minimum of 3 nodes (1 master, 2 workers for HA)
    -: nodes communicate to each other through Kubernetes API; API is exposed on master node

  Objects
    -: objects have a a 'spec' and 'status' fields; used to keep the objects in the 'spec'ificed state

## References

  - [Basics](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
  - [Concepts](https://kubernetes.io/docs/concepts/)
  - [Objects](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/)
  - [Controllers](https://kubernetes.io/docs/concepts/architecture/controller/)
  - [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)
  - [API Conventions](https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md)
  - [Setting Up a Cluster](https://kubernetes.io/docs/setup/)
  - Tools
    - [Minikube(https://kubernetes.io/docs/setup/learning-environment/minikube/)
      - is a single node cluster via the app
      - https://kubernetes.io/docs/setup/learning-environment/minikube/
      - vagrant/ubuntu/lxd: https://ubuntu.com/kubernetes/docs/install-local
    - Kind: https://github.com/kubernetes-sigs/kind
  - [DIY Cluster](https://kubernetes.io/docs/setup/production-environment/container-runtimes/#docker)
    - [Create single control-plane cluster](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)
    - [Kubernetes Ports](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#check-required-ports)
    - [Kubernetes Addons](https://kubernetes.io/docs/concepts/cluster-administration/addons/)
  - Examples
    - [Set up a cluster](https://medium.com/@joseignaciocastelli92/how-to-make-your-first-local-cluster-with-kubernetes-e15fc4b262e7)
    - [Kubeadm on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-create-a-kubernetes-cluster-using-kubeadm-on-ubuntu-18-04)
    - [Kubernetes using Ansible and Vagrant](https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/)
    - [Elasticsearch k8s example](https://sematext.com/blog/kubernetes-elasticsearch/)

### Vagrant

  - [Vagrantfile](https://www.vagrantup.com/docs/vagrantfile/)
  - [Multi-machine](https://www.vagrantup.com/docs/multi-machine/)
