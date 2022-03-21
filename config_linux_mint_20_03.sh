#!/bin/bash

echo "
/
==================================
INICIANDO CONFIGURAÇÕES DO LINUX MINT 20.03!
==================================
/
"

## Removendo travas de download externo
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

## Atualizando o ubuntu
sudo apt update &&
sudo apt upgrade &&

## Instalando pacotes e programas do repositório deb do Ubuntu ##
sudo apt install python3 git vim tilix zsh tmux curl build-essential libssl-dev &&

## Segurança caso algum pacote tenha quebrado
sudo apt-get install -f;

## Instalando o flat remix
sudo add-apt-repository ppa:daniruiz/flat-remix -y &&
sudo apt-get update && 
sudo apt-get install flat-remix-gtk -y &&
sudo apt-get install flat-remix -y &&
sudo apt-get install gnome-tweak-tool &&

## Instalando snapcraft
sudo mv /etc/apt/preferences.d/nosnap.pref ~/Documents/nosnap.backup &&
sudo apt update &&
sudo apt install snapd;

## Softwares do dia a dia 
sudo snap install insomnia &&
sudo snap install spotify &&
sudo snap install code --classic &&
sudo snap install dbeaver-ce &&
sudo snap install robo3t-snap &&
sudo snap install heroku --classic &&
sudo snap install postman &&
sudo snap install simplenote &&
sudo snap install android-studio --classic &&
sudo snap install flutter --classic &&
sudo snap install discord;

## NVM e Node
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash;
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";
nvm install 16.14.0 &&
nvm run node --version;

## Instalando pnpm
curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm;

## Instala o Docker
cd ~ &&
sudo apt-get remove docker docker-engine docker.io containerd runc || true &&
sudo apt-get update && 
sudo apt-get install docker-ce docker-ce-cli containerd.io &&
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
