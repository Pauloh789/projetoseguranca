Vagrant.configure("2") do |config|

   # Provisionamento personalizado
   config.vm.provision "shell", path: "provision.sh" 

  # Configuração para a primeira máquina (Nginx)
  config.vm.define "nginx_server" do |nginx|
    nginx.vm.box = "ubuntu/bionic64"
    nginx.vm.network "private_network", type: "dhcp"
    
    nginx.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end

    # Provisionamento para o servidor Nginx
    nginx.vm.provision "shell", path: "nginx_provision.sh"

    # Configuração do firewall (UFW) para Nginx
    nginx.vm.provision "shell", inline: <<-SHELL
      sudo apt-get install -y ufw
      sudo ufw allow 'Nginx Full'
      sudo ufw enable
    SHELL

    # Configuração de atualizações automáticas
    nginx.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get upgrade -y
    SHELL 

    config.vm.define "nginx_server" do |nginx|
      # ...
      nginx.vm.provision "shell", inline: <<-SHELL
        # Copie o arquivo de configuração personalizado
        sudo cp /vagrant/sshd_config_custom /etc/ssh/sshd_config_custom
    
        # Atualize o arquivo de configuração do SSH para usar o arquivo personalizado
        sudo sed -i 's/Include \/etc\/ssh\/sshd_config/Include \/etc\/ssh\/sshd_config_custom/' /etc/ssh/sshd_config
    
        # Reinicie o serviço SSH para aplicar as alterações
        sudo systemctl restart ssh
      SHELL
    end
  end

  # Configuração para a segunda máquina (Apache)
  config.vm.define "apache_server" do |apache|
    apache.vm.box = "ubuntu/bionic64"
    apache.vm.network "private_network", type: "dhcp"
    
    apache.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end

    # Provisionamento para o servidor Apache
    apache.vm.provision "shell", path: "apache_provision.sh"

    # Configuração do firewall (UFW) para Apache
    apache.vm.provision "shell", inline: <<-SHELL
      sudo apt-get install -y ufw
      sudo ufw allow 'Apache'
      sudo ufw enable
    SHELL

    # Configuração de atualizações automáticas
    apache.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get upgrade -y
    SHELL
  end
end
