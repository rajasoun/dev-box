# -*- mode: ruby -*-
# vi: set ft=ruby :

# Load in custom vagrant settings
require 'yaml'
settings = File.file?('vagrant.yml') ?  YAML.load_file('vagrant.yml') : {}


puts '== Using Settings From vagrant.yml =='
puts settings.inspect

VAGRANTFILE_API_VERSION = "2"
$box = settings["vagrant-name"]
$box_url = "https://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.5-x86_64-v20140504.box"
$ip = settings["network"] ["ip"]
$hostname = settings["network"] ["hostname"]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  ### Work Around to Fix Vagrant Bug in correctly assigning the provided name to the box
    
  config.vm.define settings["vagrant-name"] do |t|
  end
  config.vm.provider "virtualbox" do |p|
    p.name = $box
  end
  ### Workaround Ends ###
  
  config.vm.box = $box
  config.vm.box_url = ENV['CENTOS_BOX'] || $box_url

  required_plugins = %w( vagrant-hostsupdater vagrant-vbguest )	
  required_plugins.each do |plugin|
  	system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
  end

  config.vm.provider "virtualbox" do |v|
	 v.memory = 2048
  end

  config.vm.network "private_network", ip: $ip
  config.hostsupdater.aliases = [$hostname]

  config.vm.synced_folder "#{ENV['KC_DIR']}/kc-web/src/main/webapp", "/usr/share/nginx/knowledgecenter" if ENV['KC_DIR']

  config.vm.provision "shell", path: "provisioners/install_nginx.sh"
  config.vm.provision "file", source: "provisioners/b2b.conf", destination: "/home/vagrant/provisioners/b2b.conf"
  config.vm.provision "shell", inline: "mv /home/vagrant/provisioners/b2b.conf /etc/nginx/conf.d/b2b.conf"

  config.vm.provision "file", source: "provisioners/xkit.co.crt", destination: "/home/vagrant/provisioners/xkit.co.crt"
  config.vm.provision "shell", inline: "mv /home/vagrant/provisioners/xkit.co.crt /etc/ssl/certs/xkit.co.crt"
  config.vm.provision "file", source: "provisioners/xkit.co.key", destination: "/home/vagrant/provisioners/xkit.co.key"
  config.vm.provision "shell", inline: "mv /home/vagrant/provisioners/xkit.co.key /etc/ssl/certs/xkit.co.key"


  config.vm.provision "shell", path: "provisioners/start_nginx.sh"


end
