# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Image Virtualbox de départ
  config.vm.box = "geerlingguy/debian9"

  # CRÉATION DU RÉSEAU PRIVÉ ENTRE HOST ET GUEST (adresse IP 10.0.0.10 pour le guest, 10.0.0.1 pour le host)
  config.vm.network "private_network", ip: "10.0.0.10"

  # PARTAGE DE FICHIERS
  config.vm.synced_folder '.', '/vagrant', disabled: true
  if Vagrant::Util::Platform.linux?
    config.vm.synced_folder "../projetp2code", "/home/vagrant/lpdiwa-p2-g1", create: true, owner: "vagrant", group: "www-data"
  end

    # CONFIG SPECIFIQUE A VIRTUALBOX
   config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
        vb.memory = "512"
    # Make the VM use the host's settings as a dns resolver
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
   end

    # Script de provisionning
   config.vm.provision "shell", path: "provision.sh"
end