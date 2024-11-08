#!/bin/bash

# ATUALIZA KERNEL E GERENCIADOR DE PACOTES
sudo apt-get update && sudo apt-get full-upgrade -y
sudo apt install -f -y && sudo dpkg --configure -a
sudo apt clean -y && sudo apt autoremove -y
sudo apt autoclean -y && sudo apt remove -f -y
sudo apt-get -u dist-upgrade -y && sudo updatedb

# INSTALANDO DEPENDENCIAS
sudo apt-get install -y mtr rsyslog

# REMOEVNDO SWAP DEFAULT
if grep -q '/swapfile' /etc/fstab; then
    sudo swapoff /swapfile
    sudo rm /swapfile
fi

# CRIANDO SWAP OTIMIZADA
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# OTIMIZAÇÃO DE RENDERIZAÇÃO
echo 'nohz=on' | sudo tee -a /etc/default/grub
sudo update-grub

# OTIMIZAÇÃO DA CPU
if [ -d "/sys/devices/system/cpu/cpu0/cpufreq" ]; then
    echo 'performance' | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
else
    echo "Erro: kernel não possui suporte de otimização de CPU [❌]"
fi

# OTIMIZAÇÃO DO KERNEL
if [ -d "/sys/devices/system/cpu/cpu0/cpuidle" ]; then
    echo '1' | sudo tee /sys/devices/system/cpu/cpu*/cpuidle/state3/disable
else
    echo "Erro: kernel não possui suporte para otimização modular [❌]"
fi

# OTIMIZAÇÃO DO DISCO
if sudo fstrim -v / &> /dev/null; then
    echo "Trim realizado com sucesso."
else
    echo "Erro: kernel não possui suporte para otimização de disco [❌]"
fi
