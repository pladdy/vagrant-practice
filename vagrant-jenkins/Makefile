.PHONY: slave-keys

master_name = $(shell grep '_master" =>' Vagrantfile | sed 's/=.*//' | sed 's/"//g' | sed 's/ //')
master_ip = $(shell grep '_master" =>' Vagrantfile | cut -d '>' -f 2 | sed 's/"//g' | sed 's/ //' | sed 's/,//')

slave-keys:
	@./slave-keys

jenkins-admin:
	@echo Goto 'localhost:8080' in a browser
	@echo User: admin
	ssh-keygen -R $(master_ip)
	@echo Password: $(shell ssh -o 'StrictHostKeyChecking no' ubuntu@$(master_ip) -i .vagrant/machines/$(master_name)/virtualbox/private_key 'sudo cat /var/lib/jenkins/secrets/initialAdminPassword')

jenkins: vagrant jenkins-admin

vagrant:
	vagrant up

