#!/bin/bash
#Instala o gnome tweak tool (recomendado para distro que não vem com a ferramenta)
#Instala os temas arc-flatabulous e numix,e os icones numix icon circle e flat-remix.
	
	echo "Instalando o gnome tweak tool"
	sudo apt-get install gnome-tweak-tool -y;
	
	echo "Instalando numix-gtk-theme e numix icon circle"
	sudo apt install numix-gtk-theme -y;
	sudo add-apt-repository ppa:numix/ppa;
	sudo apt-get update;
	sudo apt-get install numix-icon-theme-circle -y;

	echo "Instalando arc-flatabulous-theme"
	sudo add-apt-repository ppa:noobslab/themes;
	sudo apt-get update;
	sudo apt-get install arc-flatabulous-theme -y;
  
  
  	echo "Instalando flat-remix icons"
  	sudo add-apt-repository ppa:daniruiz/flat-remix -y;
  	sudo apt-get update;
  	sudo apt-get install flat-remix -y;
	
	# chrome-gnome-shell instalando extensões pelo navegador
	sudo apt-get install chrome-gnome-shell -y
	
	echo "FIM DA INSTALAÇÃO!"
