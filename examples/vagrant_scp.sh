#!/usr/bin/env bash

# example script scping files over to the vm
# assumes you have a packages folder in the root directory that has things in it
for file in $(ls -d --color=never ../packages/*); do
  file_name=$(basename ${file})
  vagrant scp ${file} :/tmp/${file_name}
done
