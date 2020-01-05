include .env
export

BRANCH = master

.PHONY: commands dependencies join_command kubeadm-init restore snapshot vagrant workers-join-cluster
.PHONY: docker-login docker-logout

all: dependencies vagrant kubeadm-init install-pod-network join_command workers-join-cluster

commands:
	@egrep '^.+:$$' Makefile

dependencies:
	vagrant plugin install vagrant-env

docker-login:
	@echo '$(DOCKER_PW)' | docker login -u $(DOCKER_USER) --password-stdin

docker-logout:
	@docker logout

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
