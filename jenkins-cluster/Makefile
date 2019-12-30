.PHONY: slave-keys

# TODO: this is brittle and gross...maybe config file?
master_name = $(shell grep '_master" =>' Vagrantfile | sed 's/=.*//' | sed 's/"//g' | sed 's/ //g')
master_ip = $(shell grep '_master" =>' Vagrantfile | cut -d '>' -f 2 | sed 's/"//g' | sed 's/ //g' | sed 's/,//')

slave-keys:
	@./slave-keys

#TODO: how do i ge this command run as me the current user?
jenkins-admin:
	@echo Goto 'localhost:8080' in a browser
	@echo User: admin
	ssh-keygen -R $(master_ip)
	@echo Password:
	ssh -o 'StrictHostKeyChecking no' ubuntu@$(master_ip) -i .vagrant/machines/$(master_name)/virtualbox/private_key 'sudo cat /var/lib/jenkins/secrets/initialAdminPassword'

jenkins: vagrant jenkins-admin

vagrant:
	vagrant up

