# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "webdeploy" do |webdeploy|
	  # Use ubuntu trusty box
	  webdeploy.vm.box = "ubuntu/trusty64"
	  
	  # Define fetch box
	  webdeploy.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
	
	  # Foreward port 80 to devserver port
	  # webdeploy.vm.network :forwarded_port, guest: 80, host: 8000
	
	  webdeploy.vm.network :private_network, ip: "192.168.56.135"
	  webdeploy.vm.synced_folder "./../", "/project/", :owner => "www-data", :group => "www-data"
  
  	config.vm.provision :puppet do |puppet|
    	puppet.manifests_path = 'puppet/manifests'
    	puppet.manifest_file = 'site.pp'
    	puppet.module_path = 'puppet/modules'
  	end
  
  end
  
  
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    #vb.gui = true
  
    #vb.customize ["modifyvm", :id, "--cpus", "1"]
	vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
end
