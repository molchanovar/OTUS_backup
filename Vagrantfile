# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/8"

  config.vm.define "borgserver" do |sborg|
    sborg.vm.network "private_network", ip: "10.0.1.5", virtualbox__intnet: "net1"
    sborg.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
      # New disk for /var/backup directory  - 5 GB
      new_disk = 'newdisk.vdi'
      v.customize ['createhd', '--filename', new_disk, '--size', 5 * 1024]
      v.customize ["storagectl", :id, "--name", "SATA", "--add", "sata" ]
      v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', new_disk]
    end
    sborg.vm.hostname = "server"
    sborg.vm.provision "shell", path: "server_script.sh"
  end
  
  config.vm.define "borgclient" do |cborg|
    cborg.vm.network "private_network", ip: "10.0.1.4", virtualbox__intnet: "net1"
    cborg.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
    cborg.vm.hostname = "client"
    cborg.vm.provision "shell", path: "client_script.sh"
  end
end
