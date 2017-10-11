# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # avoid 'Innapropriate ioctl for device' messages
  # see vagrant config doc for more info: https://www.vagrantup.com/docs/vagrantfile/ssh_settings.html
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.box = "ubuntu/xenial64"

  # I tried using provision file to move over some big files and it was painfully slow.
  # do it via the vagrant-scp plugin instead or just sync a dir
  # Dir.glob('./provision/*').each do |file|
  #   config.vm.provision "file", source: file, destination: "/tmp"
  # end

  # example using a script
  config.vm.provision "bootstrap", type: "shell" do |s|
    s.path = "./provisioners/bootstrap.sh"
  end

  # example doing an inline set of commands
  config.vm.provision "adduser", type: "shell" do |s|
    s.inline = <<-SHELL
    # set up user
    USER_TO_MAKE=pladdy

    if id ${USER_TO_MAKE} > /dev/null 2>&1; then
      echo "User ${USER_TO_MAKE} already exists"
    else
      useradd -m ${USER_TO_MAKE} -s /bin/bash

      # if user is new, add go to path
      if [ $? == 0 ]; then
        echo "Updating PATH in .bashrc"
        echo PATH=$PATH:/usr/local/go/bin >> /home/${USER_TO_MAKE}/.bashrc
      fi

      echo ${USER_TO_MAKE}:${USER_TO_MAKE} | chpasswd
    fi
    SHELL
  end

  # different block, similar to above bootstrap
  config.vm.provision "poststrap", type: "shell", path: "./provisioners/poststrap.sh"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.42.42"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
