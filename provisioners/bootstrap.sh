#!/usr/bin/env bash

# put on the VM and run as part of provisioning

apt-get update
apt-get install -y nginx default-jre default-jdk

# set up user
useradd -m pladdy -s /bin/bash

# if user is new, add go to path
if [ $? == 0 ]; then
  echo "Updating PATH in .bashrc"
  echo PATH=$PATH:/usr/local/go/bin >> /home/pladdy/.bashrc
fi

echo pladdy:pladdy | chpasswd
