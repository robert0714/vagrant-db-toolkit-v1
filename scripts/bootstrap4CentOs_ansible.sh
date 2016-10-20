#!/bin/bash
#!/bin/bash

set -e

echo "Installing Ansible  on CentOS..."
A=`yum info ansible`
testing=`test $A ='Ansible'; echo $?`
echo $testing
echo  "############# ${testing} ##############"

if [ $testing > 0  ]; then
     echo "Ansible is already installed."
else
      echo "Ansible is not installed."
      yum install -y wget
      wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
      rpm -ivh  epel-release-7-8.noarch.rpm
      rm -rf epel-release-7-8.noarch.rpm
      
fi
yum -y install ansible
yum -y install jq

cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg


