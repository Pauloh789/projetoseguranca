#!/bin/bash

# Atualize os pacotes
sudo apt-get update

# Instale o Apache
sudo apt-get install -y apache2

# Iniciar o serviço do Apache
sudo systemctl start apache2

# Habilitar o Apache para iniciar na inicialização
sudo systemctl enable apache2

# Copie um arquivo HTML de exemplo (opcional)
# sudo cp /vagrant/html/index.html /var/www/html/

# Reiniciar o Apache para aplicar configurações
sudo systemctl restart apache2