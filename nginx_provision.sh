#!/bin/bash

# Atualize os pacotes
sudo apt-get update

# Instale o Nginx
sudo apt-get install -y nginx

# Iniciar o serviço do Nginx
sudo systemctl start nginx

# Habilitar o Nginx para iniciar na inicialização
sudo systemctl enable nginx

# Copie um arquivo HTML de exemplo (opcional)
# sudo cp /vagrant/html/index.html /var/www/html/

# Reiniciar o Nginx para aplicar configurações
sudo systemctl restart nginx
