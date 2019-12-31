include .env
export

.PHONY: dependencies join_command kubeadm-init restore snapshot vagrant workers-join-cluster

all: dependencies vagrant kubeadm-init install-pod-network join_command workers-join-cluster

dependencies:
	vagrant plugin install vagrant-env

install-pod-network:
	vagrant ssh $(MASTER_NAME) -t -- kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/calico.yaml

join_command:
	echo '#!/usr/bin/env bash' > $@
	vagrant ssh $(MASTER_NAME) -- -t 'sudo kubeadm token create --print-join-command' | grep kubeadm | tr -d \\r >> $@
	chmod 775 $@

kubeadm-init:
	vagrant provision --provision-with kubeadm-init

snapshot:
	vagrant snapshot push

restore:
	vagrant snapshot pop

vagrant:
	vagrant up

verify-cluster:
	vagrant ssh $(MASTER_NAME) -- -t 'kubectl get nodes'

workers-join-cluster:
	vagrant provision --provision-with join-cluster
