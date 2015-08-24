# -*- mode: ruby -*-
# vi: set ft=ruby :



# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :private_network, ip: "172.27.1.200"
  config.vm.synced_folder "../html/", "/var/www/html", create: true, owner: 'www-data', group: 'www-data'
  # config.vm.synced_folder "./", "/var/www", create: true, group: "www-data", owner: "www-data"

  config.vm.provider "virtualbox" do |v|
    v.name = "LAMP Box"
    v.customize ["modifyvm", :id, "--memory", "1024"]
  end
  config.vm.provision "shell" do |s|
    s.path = "provision/bootstrap.sh"
  end
end
