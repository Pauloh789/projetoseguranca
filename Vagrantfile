Vagrant.configure("2") do |config|

  config.vm.define "bridge" do |bridge|
    bridge.vm.box = "ubuntu/bionic64"
    bridge.vm.network "public_network", bridge: 'en0: Wi-Fi (AirPort)'
    bridge.vm.provision :shell, path: "scripts/bridge_setup.sh"
  end

  config.vm.define "vm1" do |vm1|
    vm1.vm.box = "ubuntu/bionic64"
    vm1.vm.network "private_network", ip: "192.168.33.10"
    vm1.vm.provision :shell, path: "scripts/routing_setup.sh"
  end

  config.vm.define "vm2" do |vm2|
    vm2.vm.box = "ubuntu/bionic64"
    vm2.vm.network "private_network", ip: "192.168.33.11"
    vm2.vm.provision :shell, path: "scripts/routing_setup.sh"
  end

end