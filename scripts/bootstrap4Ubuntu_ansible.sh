#!/bin/bash

set -e

echo "Installing Ansible  on Ubuntu..."
apt-get install -y software-properties-common
apt-add-repository ppa:ansible/ansible
#apt-get update
apt-get install -y --force-yes ansible
cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cf


cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg


