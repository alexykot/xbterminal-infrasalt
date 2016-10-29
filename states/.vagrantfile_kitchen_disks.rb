VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |vb|
     vb.customize ["createhd", "--filename", "disk2.vdi", "--size", "1024"]
     vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--medium", "disk2.vdi", "--port", "2", "--device", "0", "--type", "hdd"]
  end
end
