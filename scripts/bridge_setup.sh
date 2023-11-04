#!/bin/bash

# Configuração da interface de rede como bridge
cat <<EOT >> /etc/netplan/01-netcfg.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s8: 
      dhcp4: no
  bridges:
    br0:
      interfaces: [enp0s8] 
      dhcp4: no
      addresses: [192.168.33.1/24]
EOT

netplan apply
