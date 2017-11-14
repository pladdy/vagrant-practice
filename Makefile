.PHONY: vagrant

types := $(shell find ./ -name 'Vagrantfile' | cut -d '/' -f 3 | sed 's/vagrant-//')

all:
	@if [ ! -d packages ]; then mkdir packages; fi

clean:
	vagrant destroy -f
	rm -f Vagrantfile
	rm -f *.log

destroy-all:
	@for type in `echo "$(types)" | sed 's/ /  /g'`; do \
		echo "Destroying vagrant-$${type}"; \
		cd vagrant-$${type} && vagrant destroy -f; \
		cd ../; \
	done

halt-all:
	@for type in `echo "$(types)" | sed 's/ /  /g'`; do \
		echo "Halting vagrant-$${type}"; \
		cd vagrant-$${type} && vagrant halt; \
		cd ../; \
	done

save:
ifeq ("$(type)", "")
	@echo "Error: need to specify a 'type' variable with this command."
	@echo "Usage: 'make vagrant type=<the type to cp and launch>'"
	@echo "Type 'make types' to see a list of vagrant types."
	@echo
	@exit 1
endif
	sed 's/scripts/\.\.\/scripts/' Vagrantfile > Vagrantfile.new && mv Vagrantfile.new Vagrantfile
	mv Vagrantfile vagrant-$(type)/
	mv .vagrant vagrant-$(type)/
	mv *-console.log vagrant-$(type)/

types:
	@echo $(types)

update:
	vagrant box update

vagrant:
ifeq ("$(type)", "")
	@echo "Error: need to specify a 'type' variable with this command."
	@echo "Usage: 'make vagrant type=<the type to cp and launch>'"
	@echo "Type 'make types' to see a list of vagrant types."
	@echo
	@exit 1
endif
	cp vagrant-$(type)/Vagrantfile ./
	sed 's/\.\.\/scripts/scripts/' Vagrantfile > Vagrantfile.new && mv Vagrantfile.new Vagrantfile
	vagrant up
