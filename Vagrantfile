Vagrant.configure("2") do |config|
  config.vm.box = "alpine/alpine64"
  config.vm.provider :virtualbox do |vb|
    vb.cpus = 1
    vb.gui = false
    vb.cpus = 1
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    vb.memory = "256"
    vb.name = "ansible-server"
  end
  config.vm.provision "shell", inline: <<-SHELL
    chmod +x /vagrant/ansible/ansible-alpine.sh && /vagrant/ansible/ansible-alpine.sh
  SHELL

end