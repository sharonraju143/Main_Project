#!/bin/bash

set -x

# Define absolute path for the Terraform directory
TERRAFORM_DIR="/home/runner/work/Main_Project/Main_Project"

# Create or overwrite the custom.ini file with the master section
echo "[master]" > "$TERRAFORM_DIR/custom.ini"
echo "$1 ansible_ssh_private_key_file=$TERRAFORM_DIR/private_key.pem ansible_user=vengalasanjay000" >> "$TERRAFORM_DIR/custom.ini"

# Create or append the nodes section
echo "[nodes]" >> "$TERRAFORM_DIR/custom.ini"
shift  # Remove the first argument (master IP)
for node in "$@"; do
  echo "$node ansible_ssh_private_key_file=$TERRAFORM_DIR/private_key.pem ansible_user=vengalasanjay000" >> "$TERRAFORM_DIR/custom.ini"
done

# Log the contents of custom.ini
cat "$TERRAFORM_DIR/custom.ini"

set +x
