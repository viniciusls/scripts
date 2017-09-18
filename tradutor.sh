#!/bin/bash
############################################################
#Script para traduzir palavras e frases via terminal.      #
#Autor: https://github.com/soimort/translate-shell         #
#Adaptação: Matheus Mazzola & Jean Lourenço                #
############################################################

dependencia="gawk"
pacote=$(dpkg --get-selections | grep "$dependencia" )

if [ -n "$pacote" ] ;
then echo
echo -n "INICIANDO PROGRAMA..."
sleep 3
clear

else echo -n "CONFIGURANDO PROGRAMAS..."
  sleep 3
  sudo wget git.io/trans;
  sudo chmod +x trans;
  sudo mv trans /usr/bin/;
  sudo apt-get install gawk -y;
  clear
  echo -n "PRESSIONE QUALQUER TECLA PARA CONTINUAR..."
  read
  sleep 3
  clear

fi


MenuT(){
echo "**********************************************"
echo "**           Tradutor e Mais                **"
echo "**                                          **"
echo "**    [1]-Traduzir de PT para EN            **"
echo "**    [2]-Traduzir de EN para PT            **"
echo "**    [3]-Identificar uma Palavra           **"
echo "**    [4]-Dicionario                        **"
echo "**    [5]-Traduzir outra Linguagem          **"
echo "**    [6]-Lista de linguagens Disponiveis   **"
echo "**    [7]-Sair                              **"
echo "**********************************************"
echo "by: @soimort | Menu: Matheus Mazzola & Jean Lourenço."
echo
echo -n  "Digite a opção desejada: "

read opcaoT
case $opcaoT in
      1) Pt_en ;;
      2) En_pt ;;
	  3) Identificar ;;
      4) Dicionario ;;
      5) Outralingua ;;
	  6) Lista ;;
      7) clear;echo -n "SAINDO DO PROGRAMA..."; sleep 3; exit ;;
      *) echo "Opcao desconhecida."; MenuT ;
   esac
}

Pt_en(){
clear
echo "Digite a Frase a ser Traduzida: "
read frase
clear
trans pt:en "$frase"

read -p "Presione qualquer tecla para continuar"
sleep 2
clear
        MenuT
}
En_pt(){
clear
echo "Digite a Frase a ser Traduzida: "
read frase
clear
trans en:pt "$frase"

read -p "Presione qualquer tecla para continuar"
sleep 2
clear
        MenuT
}
Identificar(){
clear
echo "Digite a Palavra a ser Identificada: "
read palavra
clear
trans -id $palavra

read -p "Presione qualquer tecla para continuar"
sleep 2
clear
        MenuT
}
Dicionario(){
clear
echo "Digite a palavra a ser pesquisada no dicionario PT ou EN: "
read palavra
clear
trans -d $palavra

read -p "Presione qualquer tecla para continuar"
sleep 2
clear
        MenuT
}
Outralingua(){
clear

echo "Digite a Sigua da Linguagem a Ser Traduzida: "
read um
clear
echo "Digite Agora a Sigua da Linguagem Desejada: "
read dois
clear
echo "Agora Digite a Frase: "
read frase
clear
trans $um:$dois "$frase"

read -p "Presione qualquer tecla para continuar"
sleep 2
clear
        MenuT
}
Lista(){
clear

trans -R

read -p "Presione qualquer tecla para continuar"
sleep 2
clear
        MenuT
}
MenuT
