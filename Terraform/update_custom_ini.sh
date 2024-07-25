#!/bin/bash

# Create or overwrite the custom.ini file with the master section
echo "[master]" > custom.ini
echo "$1 ansible_ssh_private_key_file=~~/.ssh/id_rsa ansible_user=vengalasanjay000" >> custom.ini

# Create or append the nodes section
echo "[nodes]" >> custom.ini
shift  # Remove the first argument (master IP)
for node in "$@"; do
  echo "$node ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_user=vengalasanjay000" >> custom.ini
done
