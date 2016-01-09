# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder ".", "/home/vagrant/code", type: "nfs"

  config.dns.tld = "dev"
  config.vm.hostname = "ruby"
  config.ssh.forward_agent = true
  config.vm.network :private_network, ip: "33.33.33.60"

  config.vm.provision "shell", path: "set_swapfile.sh", privileged: true
  config.vm.provision "shell", path: "bootstrap.sh", privileged: false
end

