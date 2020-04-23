#!/bin/bash

echo "
/
==================================
INICIANDO CONFIGURAÇÕES DO UBUNTU!
==================================
/
"

## Atualizando o ubuntu
sudo apt update && 
sudo apt upgrade

## Instalando pacotes e programas do repositório deb do Ubuntu ##
sudo apt install python3 python-pip wine git build-essential libssl-dev flatpak gnome-software-plugin-flatpak -y &&


## Remove o launch da amazon
sudo apt remove ubuntu-web-launchers &&
sudo rm /usr/share/applications/ubuntu-amazon-default.desktop &&
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js &&
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json;

## Softwares do dia a dia 
sudo snap install insomnia &&
sudo snap install spotify &&
sudo snap install code --classic &&
sudo snap install postman &&
sudo snap install dbeaver-ce &&
sudo snap install icloud-for-linux &&
sudo snap install chromium &&
sudo snap install robo3t-snap;

## Instala o Docker e o Kitematic
sudo apt-get remove docker docker-engine docker.io containerd runc &&
sudo apt install docker.io &&
sudo systemctl start docker &&
sudo systemctl enable docker;

## Atualização do sistema
sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y;

echo "
/
============================
FINALIZADO
============================
/
";