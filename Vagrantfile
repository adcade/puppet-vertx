# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.provision :puppet do |puppet|
     puppet.module_path    = ".."
     puppet.manifests_path = "tests"
     puppet.manifest_file  = "test.pp"
  end
end
