.PHONY: install-go

clean:
	rm -f Vagrantfile
	rm *.log

install-go:
	cp install-go/Vagrantfile ./
	vagrant up
