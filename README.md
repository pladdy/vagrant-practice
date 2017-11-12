# Vagrant
It's a thing and it's useful.  Vagrant is a tool to manage virtual machines: https://www.vagrantup.com/intro/index.html

I'm using it with VirtualBox a virutalizer that can let you run 'virtual machines': https://www.virtualbox.org/wiki/VirtualBox

This is a scratch pad for me to learn how to use vagrant and virtualbox (but mostly vagrant)

## Packages
To save time, some scripts won't download packages but assume they're in the `packages/` directory.

Packages can be downloaded in advance but some scripts will also download their automatically.

## Notes
To ssh manually (not vagrant ssh) into a box with ubuntu/xenial and defined as 'jenkins-master':
`ssh ubuntu@192.168.50.2 -v -i .vagrant/machines/jenkins-master/virtualbox/private_key`
