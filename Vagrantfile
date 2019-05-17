# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

cluster = {
  "master" => { :ip => "192.168.33.10", :cpus => 1, :mem => 512, :script => "ansible-server.sh" },
  "slave1" => { :ip => "192.168.33.11", :cpus => 1, :mem => 512, :script => "ansible-node.sh"},
  "slave2" => { :ip => "192.168.33.12", :cpus => 1, :mem => 512, :script => "ansible-node.sh"},
  "slave3" => { :ip => "192.168.33.13", :cpus => 1, :mem => 512, :script => "ansible-node.sh"},
  "slave4" => { :ip => "192.168.33.14", :cpus => 1, :mem => 512, :script => "ansible-node.sh"},
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  cluster.each_with_index do |(hostname, info), index|
    config.vm.define hostname do |cfg|
      cfg.vm.provider :virtualbox do |vb, override|
        config.vm.box = "alpine/alpine64"
        #override.vm.network "private_network", ip: "#{info[:ip]}"
        config.vm.synced_folder "ansible", "/vagrant"
        #override.vm.cpus = "#{info[:cpus]}"
        vb.gui = false
        vb.customize ["modifyvm", :id, "--memory", info[:mem], "--cpus", info[:cpus], "--hwvirtex", "on", "--cpuexecutioncap", "50"]
        #override.vm.memory = info[:mem]
        vb.name = hostname
        override.vm.provision "shell", inline: <<-SHELL
          #ls -al /vagrant
          #chmod +x /vagrant/#{info[:script]} && /vagrant/#{info[:script]}
        SHELL
      end
    end
  end
end