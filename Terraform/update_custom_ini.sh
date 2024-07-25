#!/bin/bash

# Specify the directory where custom.ini should be created
OUTPUT_DIR="$(dirname "$0")"

# Create or overwrite the custom.ini file with the master section
echo "[master]" > "$OUTPUT_DIR/custom.ini"
echo "$1 ansible_ssh_private_key_file=~/Terraform/private_key.pem ansible_user=vengalasanjay000" >> "$OUTPUT_DIR/custom.ini"

# Create or append the nodes section
echo "[nodes]" >> "$OUTPUT_DIR/custom.ini"
shift  # Remove the first argument (master IP)
for node in "$@"; do
  echo "$node ansible_ssh_private_key_file=~/Terraform/private_key.pem ansible_user=vengalasanjay000" >> "$OUTPUT_DIR/custom.ini"
done
