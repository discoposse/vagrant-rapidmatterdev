# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "rapidmatterdev" do |rapidmatterdev|
    rapidmatterdev.vm.hostname = "rapidmatterdev"
    rapidmatterdev.vm.box = "trusty-server"
    rapidmatterdev.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
    rapidmatterdev.vm.network :private_network, ip: "192.168.42.42", :netmask => "255.255.255.0"
  end
  config.vm.provision :shell, :path => "rapidmatterdev.sh"
end