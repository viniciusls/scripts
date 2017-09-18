#!/bin/bash
#------------------------------------
#Nome: makepc.sh
#Autor: Jean Rodrigues. 02/07/2017
#Função: Configurar meus pcs pessoal
#-------------------------------------

#Atualizações.
sudo apt-get update && sudo apt-get upgrade -y;

#Criando diretorio de scripts
sudo mkdir -p /home/configs/scripts;
sudo chmod -R 777 /home/configs;

#SSH e chave pública

ssh-keygen -t rsa -N '';
sudo apt-get install openssh-server -y;
apt-get install openssh-client -y;

#Instalando programas úteis.

echo "Instalando o git, gnome-tweak-tool, numix-gtk-theme e numix icon circle"
sudo apt-get install git -y;
cd /home/;sudo chmod 777 .;cd;
sudo apt-get install gnome-tweak-tool -y;
sudo mkdir /tmp/dotfile/
sudo chmod -R 777 /tmp/dotfile/;
cd /tmp/dotfile
sudo mkdir numix; cd numix
git clone https://github.com/cldx/numix-gtk-theme
git clone https://github.com/numixproject/numix-icon-theme
git clone https://github.com/numixproject/numix-icon-theme-circle
sudo mv numix-gtk-theme /usr/share/themes
sudo mv numix-icon-theme/Numix/ /usr/share/icons
sudo mv numix-icon-theme-circle/Numix-Circle/ /usr/share/icons; cd -

echo "Instalando o curl"
sudo apt-get install curl;

echo "Instalando mysql-client"
sudo apt-get install mysql-client -y;

echo "Instalando Vim"
sudo apt-get install vim -y;

echo "Instalando Terminator"
sudo apt-get install terminator -y;

echo "Instalando Atom"
sudo apt-get update;
sudo add-apt-repository ppa:webupd8team/atom -y;
sudo apt-get update;
sudo apt-get install atom -y;

echo "Instalando Gparted Gerenciador de discos"
sudo apt-get install gparted -y;

echo "Instalando Synaptic Gerenciador de pacotes"
sudo apt-get install synaptic -y;

echo "Instalando Vlc player"
sudo apt-get install vlc -y;

echo "Instalando htop"
sudo apt-get install htop -y;

echo -e "INSTALANDO O GOOGLE CHROME STABLE";
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
sudo dpkg -i google-chrome-stable_current_amd64.deb;
sudo apt-get -f install;

echo "Instalando spotify"
sudo sh -c "echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list";
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886;
sudo apt-get update;
sudo apt-get install spotify-client -y;

echo "Instalando LUKUS para criptografia de pendrive"
sudo apt-get install cryptsetup -y;

#Configurando o .bashrc
curl -L https://raw.githubusercontent.com/jeanrafaellourenco/scripts/master/bashrc > .bashrc

clear;
echo -e " \033[1;33m  **COPIE ESTA CHAVE E ADICIONE NA SUA CONTA NO GITHUB**\033[0m";
echo "";
#cat /home/$USER/.ssh/*.pub;
find /home/$USER/.ssh -name '*.pub' -exec cat {} \;
echo "";
echo -e " \033[1;33m No Github, vá em Settings, SSH and GPG Keys, clique em New SSH Key, cole o conteúdo da chave e salve. \033[0m";
git config --global user.email "loginsocial@outlook.com";
git config --global user.name "Jean Lourenço";
