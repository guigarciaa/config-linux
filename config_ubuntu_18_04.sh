#!/bin/bash

echo "
/
==================================
INICIANDO CONFIGURAÇÕES DO UBUNTU 18.04!
==================================
/
"

## Removendo travas de download externo
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

## Atualizando o ubuntu
sudo apt update &&
sudo apt upgrade &&

## Instalando pacotes e programas do repositório deb do Ubuntu ##
sudo apt install python git vim vim-gnome tilix zsh tmux curl build-essential libssl-dev &&

## Segurança caso algum pacote tenha quebrado
sudo apt-get install -f;

# Instalando o Wine
cd ~ &&
sudo dpkg --add-architecture i386 &&
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add - &&
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' || true &&
sudo apt update &&
sudo apt install --install-recommends winehq-stable;


## Instalando o flat remix
sudo add-apt-repository ppa:daniruiz/flat-remix -y &&
sudo apt-get update && 
sudo apt-get install flat-remix-gtk -y &&
sudo apt-get install flat-remix -y &&
sudo apt-get install gnome-tweak-tool &&


## Remove o launch da amazon
sudo apt remove ubuntu-web-launchers || true &&
sudo rm /usr/share/applications/ubuntu-amazon-default.desktop || true &&
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js || true &&
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json || true;

## Softwares do dia a dia 
sudo snap install insomnia &&
sudo snap install spotify &&
sudo snap install code --classic &&
sudo snap install dbeaver-ce &&
sudo snap install chromium &&
sudo snap install robo3t-snap &&
sudo snap install heroku --classic &&
sudo snap install ruby --classic;

## NVM e Node
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash;
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";
nvm install 12.14.1 &&
nvm run node --version;

## Instala o Docker, Kitematic e YADR para usar o  GVim
#Docker
cd ~ &&
sudo apt-get remove docker docker-engine docker.io containerd runc || true &&
sudo apt-get update && 
sudo apt install docker.io &&
sudo systemctl start docker &&
sudo systemctl enable docker;
#Kitematic
mkdir Programas || true &&
cd Programas &&
wget https://github.com/docker/kitematic/releases/download/v0.17.11/Kitematic-0.17.11-Ubuntu.zip || true &&
unzip Kitematic-0.17.11-Ubuntu.zip &&
sudo dpkg -i Kitematic-0.17.11_amd64.deb;
#Yadr
cd ~ &&
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh `" || true &&
cd ~/.yadr && 
rake install;

## Atualização do sistema
sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y;

echo "
/
============================
FINALIZADO
============================
/
";
