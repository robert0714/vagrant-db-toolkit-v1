#!/bin/bash
#!/bin/bash

set -e

echo "Installing Ansible  on CentOS..."
#apt-get install -y software-properties-common
#apt-add-repository ppa:ansible/ansible
#apt-get update
#apt-get install -y --force-yes ansible
#cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cf

testfile=/dev/shm/netstat_checking.txt
yum info ansible  -tuln > ${testfile}   # 先轉存資料到記憶體當中！不用一直執行 netstat
testing=$(grep "ansible" ${testfile})   # 偵測看 port 80 在否？

if [ "${testing}" != "" ]; then
	echo "Ansible is already installed."
else
  	echo "Ansible is not installed."
fi

yum install -y wget
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
rpm -ivhf  --quiet epel-release-7-8.noarch.rpm
rm -rf epel-release-7-8.noarch.rpm
yum -y install ansible
yum -y install jq
#yum -y update

#sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
#[dockerrepo]
#name=Docker Repository
#baseurl=https://yum.dockerproject.org/repo/main/centos/7/
#enabled=1
#gpgcheck=1
#gpgkey=https://yum.dockerproject.org/gpg
#EOF

#sudo yum  -y install docker-engine
#sudo chkconfig docker on
#sudo service docker start

cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg


