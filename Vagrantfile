# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos64"
  config.vm.box_url = "http://lmm.boardev.com/vagrant/vagrant-centos64.box"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet'
    puppet.module_path = 'puppet/modules'
    puppet.manifest_file  = 'vagrant.pp'
  end

  config.vm.network :forwarded_port, guest: 8080, host: 8080,  auto_correct: true
end
