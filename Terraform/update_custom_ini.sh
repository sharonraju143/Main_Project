#!/bin/bash

# Define the output file path
OUTPUT_FILE="/home/runner/work/Main_Project/Main_Project/Terraform/custom.ini"

# Create or overwrite the custom.ini file
echo "[master]" > "$OUTPUT_FILE"
echo "$1 ansible_ssh_private_key_file=/home/runner/work/Main_Project/Main_Project/Terraform/private_key.pem ansible_user=vengalasanjay000" >> "$OUTPUT_FILE"

# Create or append the nodes section
echo "[nodes]" >> "$OUTPUT_FILE"
shift  # Remove the first argument (master IP)
for node in "$@"; do
  echo "$node ansible_ssh_private_key_file=/home/runner/work/Main_Project/Main_Project/Terraform/private_key.pem ansible_user=vengalasanjay000" >> "$OUTPUT_FILE"
done
