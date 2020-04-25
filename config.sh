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
sudo apt install python3 python-pip wine git build-essential libssl-dev flatpak gnome-software-plugin-flatpak -y  && 


## Instalando o flat remix
sudo add-apt-repository ppa:daniruiz/flat-remix -y && sudo apt-get update && sudo apt-get install flat-remix-gtk -y && sudo apt-get install flat-remix -y && sudo apt-get install gnome-tweak-toll &&


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

## Instalando o versionador de linguagem asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8 &&
. $HOME/.asdf/asdf.sh &&

## Instalando o plugin do node e sua ultima versão
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git &&
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring &&
asdf install nodejs 14.0.0 &&
asdf global nodejs 14.0.0;


## Instala o Docker e o Kitematic
sudo apt-get remove docker docker-engine docker.io containerd runc &&
sudo apt-get update && 
sudo apt install docker.io &&
sudo systemctl start docker &&
sudo systemctl enable docker &&
mkdir Programas &&
cd Programas &&
wget https://github.com/docker/kitematic/releases/download/v0.17.11/Kitematic-0.17.11-Ubuntu.zip &&
unzip Kitematic-0.17.11-Ubuntu.zip &&


## Atualização do sistema
sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y;

echo "
/
============================
FINALIZADO
============================
/
";
