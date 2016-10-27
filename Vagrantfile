# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end
  config.vm.define "oracledb" do |d|
#   config.ssh.insert_key = false 
    d.vm.box ="centos/7"
#    d.vm.box ="ubuntu/trusty64"
#    d.vm.box ="bento/ubuntu-14.04"
#    d.vm.box = "ubuntu/wily64"
    d.vm.hostname = "oracledb"
    d.vm.network "private_network", ip: "200.200.200.200" 
    d.vm.provision :shell, path: "scripts/bootstrap4CentOs_ansible.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/oracledb-centos.yml -c local"
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
  config.vm.define "mysqldb" do |d|
#   config.ssh.insert_key = false 
    d.vm.box ="centos/7"
    d.vm.hostname = "mysqldb"
    d.vm.network "private_network", ip: "200.200.200.201" 
    d.vm.provision :shell, path: "scripts/bootstrap4CentOs_ansible.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/mysqldb-centos.yml -c local"
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
  config.vm.define "postgresql" do |d|
#   config.ssh.insert_key = false 
    d.vm.box ="ubuntu/wily64"
    d.vm.hostname = "postgresql"
    d.vm.network "private_network", ip: "200.200.200.202" 
    d.vm.provision :shell, path: "scripts/bootstrap4Ubuntu_ansible.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/postgresql-centos.yml -c local"
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end  
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
