#!/bin/bash

# Adiciona a rota para a bridge
ip route add 192.168.33.0/24 via 192.168.33.1

# Adiciona a rota para a outra máquina virtual
ip route add 192.168.33.11 via 192.168.33.1 
