#!/bin/bash

# Defina o nome de usuário e senha
USERNAME="paulo"
PASSWORD="123456789"

# Crie o usuário
useradd -m -p $(openssl passwd -1 123456789) paulo

# Adicione o usuário ao grupo sudo (opcional)
usermod -aG sudo paulo

# Atualize o sistema
apt-get update

# Provisionamento personalizado
# config.vm.provision "shell", path: "provision.sh"