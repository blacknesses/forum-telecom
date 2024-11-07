#!/bin/bash

# ATUALIZA KERNEL E GERENCIADOS DE PACOTES
sudo apt-get update ; sudo apt-get full-upgrade -y ; sudo apt install -f -y ; sudo dpkg --configure -a ; sudo apt clean -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt remove -f -y && sudo apt-get -u dist-upgrade -y && sudo updatedb"

# OTIMIZAÇÃO DA SWAP
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# OTIMIZAÇÃO DA CPU
echo 'performance' | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# OTIMIZAÇÃO DO KERNEL
echo '1' | sudo tee /sys/devices/system/cpu/cpu*/cpuidle/state3/disable
echo 'nohz=on' | sudo tee -a /etc/default/grub
sudo update-grub

# OTIMIZAÇÃO DO DISCO
sudo fstrim -v /
