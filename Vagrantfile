Vagrant.configure(2) do |config|

  config.vm.box = "amp_centos6.4"
  config.vm.box_url = "http://wdev.qa.admarketplace.net/vagrant_boxes/jenkins_base/centos_6.4_base.box"

	config.vm.hostname = "kafka"

	config.vm.network "private_network", ip: "192.168.200.200"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "kafka"
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--usb", "off"]
    vb.customize ["modifyvm", :id, "--usbehci", "off"]
  end

  config.vm.hostname = "kafka"

  config.vm.provision "shell", path: "./scripts/bootstrap.sh"

end
