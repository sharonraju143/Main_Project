#!/bin/bash

# Logging
set -x

# Create or overwrite the custom.ini file with the master section
echo "[master]" > Terraform/custom.ini
echo "$1 ansible_ssh_private_key_file=~/Terraform/private_key.pem ansible_user=vengalasanjay000" >> Terraform/custom.ini

# Create or append the nodes section
echo "[nodes]" >> Terraform/custom.ini
shift  # Remove the first argument (master IP)
for node in "$@"; do
  echo "$node ansible_ssh_private_key_file=~/Terraform/private_key.pem ansible_user=vengalasanjay000" >> Terraform/custom.ini
done

# Logging
cat Terraform/custom.ini
set +x
