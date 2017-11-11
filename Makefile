.PHONY: vagrant

all:
	mkdir packages

clean:
	vagrant destroy -f
	rm -f Vagrantfile
	rm -f *.log

types:
	find ./ -name 'Vagrantfile' | cut -d '/' -f 3 | sed 's/vagrant-//'

update:
	vagrant box update

vagrant:
ifeq ("$(type)", "")
	@echo "Error: need to specify a type variable with this command."
	@echo "Usage: 'make vagrant type=<the type to cp and launch>'"
	@echo "Type 'make types' to see a list of vagrant types."
	@echo
	@exit 1
endif
	cp vagrant-$(type)/Vagrantfile ./
	vagrant up
