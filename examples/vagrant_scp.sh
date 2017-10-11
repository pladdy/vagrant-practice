#!/usr/bin/env bash

# set up script to orchestrate setting up the vm
vagrant up --provision-with bootstrap

for file in $(ls -d --color=never provisioners/tmp/*); do
  file_name=$(basename ${file})
  vagrant scp ${file} :/tmp/${file_name}
done

vagrant provision --provision-with poststrap
