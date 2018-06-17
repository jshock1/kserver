# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "geerlingguy/ubuntu1604"

  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |v|
    v.name = "kokko-app"
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.define "kokko_app"
  config.vm.hostname = "kokko-app"
  config.vm.network :private_network, ip: "192.168.33.7"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "deploy/playbooks/main.yml"
    ansible.become = true
  end

end
