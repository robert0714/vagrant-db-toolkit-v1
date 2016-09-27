# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end
  config.vm.define "oracledb" do |d|
  config.ssh.insert_key = false 
    d.vm.box = "bento/centos-7.2"
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
  config.ssh.insert_key = false 
    d.vm.box = "bento/centos-7.2"
    d.vm.hostname = "mysqldb"
    d.vm.network "private_network", ip: "200.200.200.201" 
    d.vm.provision :shell, path: "scripts/bootstrap4CentOs_ansible.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/mysqldb-centos.yml -c local"
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
  config.vm.define "postgresql" do |d|
  config.ssh.insert_key = false 
    d.vm.box = "bento/centos-7.2"
    d.vm.hostname = "postgresql"
    d.vm.network "private_network", ip: "200.200.200.202" 
    d.vm.provision :shell, path: "scripts/bootstrap4CentOs_ansible.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/postgresql-centos.yml -c local"
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
  config.vm.define "mssql" do |d|
    if ! File.exists?('./SQLEXPRWT_x64_ENU.exe')
      puts 'SQL Server installer could not be found!'
      puts "Please run:\n  wget http://download.microsoft.com/download/0/4/B/04BE03CD-EAF3-4797-9D8D-2E08E316C998/SQLEXPRWT_x64_ENU.exe"
#      exit 1
    end
    d.vm.box = "opentable/win-2008r2-standard-amd64-nocm" 
    d.vm.network "private_network", ip: "200.200.200.203"
    d.vm.network :forwarded_port, guest: 3389, host: 3389
    d.vm.provision :shell, path: "scripts/mssql/install-dot-net.ps1"
    d.vm.provision :shell, path: "scripts/mssql/install-sql-server.cmd"
    d.vm.provision :shell, path: "scripts/mssql/configure-sql-port.ps1"
    d.vm.provision :shell, path: "scripts/mssql/enable-rdp.ps1"
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
    config.vbguest.no_install = true
    config.vbguest.no_remote = true
  end
end
