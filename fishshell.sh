#!/bin/bash

echo -e " \033[1;34m **NO FINAL DA INSTALAÇÃO EXECUTE MANUALMENTE O COMANDO: 'omf install agnoster' sem aspas.** \033[0m";
sleep 5;

#Instalando tema.
    sudo apt-get install python-pip git -y;
    sudo pip install --user git+git://github.com/Lokaltog/powerline;
    
echo '''

if [ -d "$HOME/.local/bin" ];then
    PATH="$HOME/.local/bin:$PATH"

fi

''' >> ~/.profile;

    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/;
    fc-cache -vf ~/.fonts;
    mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/;
    fc-cache -vf ~/.fonts;
    clear;
    
    sudo apt-get install fish;
    curl -L https://get.oh-my.fish | fish;
    #Rodar na mão >> omf install agnoster
    
