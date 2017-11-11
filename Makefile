.PHONY: vagrant-go

all:
	mkdir packages

clean:
	vagrant destroy -f
	rm -f Vagrantfile
	rm -f *.log

list:
	find ./ -name 'Vagrantfile'

vagrant-go:
	cp vagrant-go/Vagrantfile ./
	vagrant up
