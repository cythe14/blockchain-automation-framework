#!/bin/bash
set -e

echo "Starting build process..."

echo "Adding env variables..."
export PATH=/root/bin:$PATH

#Path to k8s config file
KUBECONFIG=/home/abel/Documents/BAF/blockchain-automation-framework/build/config


echo "Running the playbook..."
exec ansible-playbook -vvv /home/abel/Documents/BAF/blockchain-automation-framework/platforms/shared/configuration/site.yaml --inventory-file=/home/abel/Documents/BAF/blockchain-automation-framework/platforms/shared/inventory/ -e "@/home/abel/Documents/BAF/blockchain-automation-framework/build/network.yaml" -e 'ansible_python_interpreter=/usr/bin/python3'

exec ansible-playbook -vvv /home/abel/Documents/BAF/blockchain-automation-framework/platforms/r3-corda/configuration/deploy-cordapps.yaml -e "@path-to-network.yaml" -e "source_dir='/home/abel/Documents/cordapps/Advanced'"
