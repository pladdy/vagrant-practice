# TODO: it's gross having ips and vm names hard coded here
#
slave-keys:
	@echo slave-0
	@echo ip: 192.168.50.3
	@echo Key:
	@echo $(shell ssh -o 'StrictHostKeyChecking no' ubuntu@192.168.50.3 -i .vagrant/machines/slave-0/virtualbox/private_key 'sudo -u jenkins-slave cat /home/jenkins-slave/.ssh/id_rsa')
	@echo slave-1
	@echo ip: 192.168.50.4
	@echo Key:
	@echo $(shell ssh -o 'StrictHostKeyChecking no' ubuntu@192.168.50.4 -i .vagrant/machines/slave-1/virtualbox/private_key 'sudo -u jenkins-slave cat /home/jenkins-slave/.ssh/id_rsa')

jenkins: vagrant
	@echo Goto 'localhost:8080' in a browser
	@echo User: admin
	@echo Password: $(shell ssh ubuntu@192.168.50.2 -i .vagrant/machines/jenkins-master/virtualbox/private_key 'sudo cat /var/lib/jenkins/secrets/initialAdminPassword')

vagrant:
	vagrant up

