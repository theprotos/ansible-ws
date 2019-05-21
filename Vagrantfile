# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

cluster = {
  "master" => { :ip => "192.168.101.10", :cpus => 1, :mem => 512, :os => "centos/7", :script => "ansible-server-centos.sh" },
  "slave1" => { :ip => "192.168.101.11", :cpus => 1, :mem => 512, :os => "centos/7", :script => "ansible-node.sh"},
  "slave2" => { :ip => "192.168.101.12", :cpus => 1, :mem => 512, :os => "ubuntu/bionic64", :script => "ansible-node.sh"},
  "slave3" => { :ip => "192.168.101.13", :cpus => 1, :mem => 512, :os => "centos/7", :script => "ansible-node.sh"},
  "slave4" => { :ip => "192.168.101.14", :cpus => 1, :mem => 512, :os => "ubuntu/bionic64", :script => "ansible-node.sh"},
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  cluster.each_with_index do |(hostname, info), index|
    config.vm.define hostname do |cfg|
      cfg.vm.provider :virtualbox do |vb, override|
        #config.vm.box = "alpine/alpine64"
        override.vm.box = "#{info[:os]}"
        override.vm.network "private_network", ip: "#{info[:ip]}"
        config.vm.synced_folder "ansible", "/vagrant"
        #override.vm.cpus = "#{info[:cpus]}"
        vb.gui = false
        vb.customize ["modifyvm", :id, "--memory", info[:mem], "--cpus", info[:cpus], "--hwvirtex", "on", "--cpuexecutioncap", "50"]
        #override.vm.memory = info[:mem]
        vb.name = hostname
        if hostname != "master"
          config.vm.provision "file", source: ".ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
        else
          config.vm.provision "file", source: ".ssh/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
        end
        public_key = File.read(".ssh/id_rsa.pub")
        override.vm.provision "shell", inline: <<-SHELL
          echo 'Copying ansible-vm public SSH Keys to the VM'
          mkdir -p /home/vagrant/.ssh
          chmod 700 /home/vagrant/.ssh
          echo '#{public_key}' >> /home/vagrant/.ssh/authorized_keys
          chmod -R 600 /home/vagrant/.ssh/authorized_keys
          echo 'Host 192.*.*.*' >> /home/vagrant/.ssh/config
          echo 'StrictHostKeyChecking no' >> /home/vagrant/.ssh/config
          echo 'UserKnownHostsFile /dev/null' >> /home/vagrant/.ssh/config
          chmod -R 600 /home/vagrant/.ssh/config
        SHELL
        override.vm.provision "shell", inline: <<-SHELL
          chmod +x /vagrant/#{info[:script]} && /vagrant/#{info[:script]}
        SHELL
      end
    end
  end

end