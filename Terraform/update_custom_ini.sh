#!/bin/bash

# Define the output file path
OUTPUT_FILE="/home/runner/work/Main_Project/Main_Project/Terraform/custom.ini"

# Get IP addresses from Terraform outputs
MASTER_IP="$1"
NODE_1_IP="$2"
NODE_2_IP="$3"

# Create or overwrite the custom.ini file
echo "[master]" > "$OUTPUT_FILE"
echo "$MASTER_IP ansible_ssh_private_key_file=/home/runner/work/Main_Project/Main_Project/Terraform/private_key.pem ansible_user=vengalasanjay000" >> "$OUTPUT_FILE"

# Create or append the nodes section
echo "[nodes]" >> "$OUTPUT_FILE"
echo "$NODE_1_IP ansible_ssh_private_key_file=/home/runner/work/Main_Project/Main_Project/Terraform/private_key.pem ansible_user=vengalasanjay000" >> "$OUTPUT_FILE"
echo "$NODE_2_IP ansible_ssh_private_key_file=/home/runner/work/Main_Project/Main_Project/Terraform/private_key.pem ansible_user=vengalasanjay000" >> "$OUTPUT_FILE"
