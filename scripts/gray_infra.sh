#!/bin/bash

# Name: gray_infra.sh
# Author: KG
# CDT Fall 2024 - Alpha
# Gray Team Infrastructure Deployment Script
# This script is to deploy the base VMs needed for gray team:
# ansible_core, scoring
# 
# Pre-Reqs:
# apt install python-dev python-pip
# pip install python-openstackclient
#
# cdt-alpha-openrc.sh downloaded from openstack 
# SSH key was added into openstack

#ENV VARS
#OPENSTACKENV Location of OpenStack API key
#ANSIBLE_SIZE "Flavor" of VM in OpenStack
#ANSIBLE_IMAGE Image chosen for ansible NOTE: Script assumes debian-based OS that uses APT
#ANSIBLE_NAME Name of VM 
#ANSIBLE_SECGROUP Name of security group to be created
#ANSIBLE_CLOUDINIT Name of cloudinit file to preinstall packages on ansible core
#SCOREVM_SIZE "Flavor" of VM in OpenStack
#SCOREVM_IMAGE Image chosen for scoring vm NOTE: Script assumes debian-based OS that uses APT
#SCOREVM_NAME Name of VM 
#SCOREVM_SECGROUP Name of security group to be created
#GRAY_SSH The name of the SSH key that is imported in OpenStack
#SSHJUMPNET OpenStack ID for SSHJumpNet on CyberRange OpenStack enviornment
#GRAY_NIC OpenStack ID for the nic ex: 0026c949-8daa-4c7d-bed5-e40259eb9ce8

OPENSTACKENV=./cdt-alpha-openrc.sh
ANSIBLE_SIZE=medium-large
ANSIBLE_IMAGE=DebianBookworm12
ANSIBLE_NAME=ansible_core
ANSIBLE_SECGROUP=ansible-sec
ANSIBLE_CLOUDINIT=./ansible-cloud.yaml
SCOREVM_SIZE=large
SCOREVM_IMAGE=DebianBookworm12-Desktop
SCOREVM_NAME=scoring
SCOREVM_SECGROUP=scoring-sec

GRAY_SSH=pitboss
SSHJUMPNET=e721ed5e-fefc-48d9-ad0f-7b9022a81b56
GRAY_NIC=0026c949-8daa-4c7d-bed5-e40259eb9ce8

# add enviornment variables, authenticate to openstack
source $OPENSTACKENV

# # ansible_core
# # Create and configure security group in openstack
# echo "Creating Ansible Security Group"
# if openstack security group list | grep -q $ANSIBLE_SECGROUP; then
#     echo "Security group $ANSIBLE_SECGROUP already exists deleting..."
#     openstack security group delete $ANSIBLE_SECGROUP
# fi
#     openstack security group create $ANSIBLE_SECGROUP

# openstack security group rule create --protocol any $ANSIBLE_SECGROUP

# Create VM in OpenStack
if openstack server list | grep -q $ANSIBLE_NAME; then
    echo "Ansible VM is Already deployed... deleting"
    openstack server stop $ANSIBLE_NAME 
    openstack server delete $ANSIBLE_NAME --wait
fi
echo "Deploying Ansible VM..."
openstack server create --wait --flavor $ANSIBLE_SIZE --boot-from-volume 50 --image $ANSIBLE_IMAGE --key-name $GRAY_SSH --nic net-id=$GRAY_NIC,v4-fixed-ip=10.21.17.42 --nic net-id=$SSHJUMPNET --security-group $ANSIBLE_SECGROUP --user-data $ANSIBLE_CLOUDINIT --availability-zone gcicompute08 $ANSIBLE_NAME

# scoring
# Create and configure security group in openstack
# echo "Creating Scoring Security Group"
# if openstack security group list | grep -q $SCOREVM_SECGROUP; then
#     echo "Security group $SCOREVM_SECGROUP already exists deleting..."
#     openstack security group delete $SCOREVM_SECGROUP
# fi
# openstack security group create $SCOREVM_SECGROUP
# openstack security group rule create --protocol any $SCOREVM_SECGROUP

# Create VM in OpenStack
if openstack server list | grep -q $SCOREVM_NAME; then
    echo "Scoring VM is Already deployed... deleting"
    openstack server stop $SCOREVM_NAME 
    openstack server delete $SCOREVM_NAME --wait
fi
echo "Deploying Scoring VM..."
openstack server create --wait --flavor $SCOREVM_SIZE --boot-from-volume 50 --image $SCOREVM_IMAGE --key-name $GRAY_SSH --nic net-id=$GRAY_NIC,v4-fixed-ip=10.21.17.43 --nic net-id=$SSHJUMPNET --security-group $SCOREVM_SECGROUP --availability-zone gcicompute08 $SCOREVM_NAME
