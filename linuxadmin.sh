#!/bin/bash

#Nome: admin
#Autor: Alexandre Pina. 02/12/2013.
#Adaptado por: Jean Rodrigues em 19/10/2016.
#Função: Criar um assistente para tarefas de rotina de administradores de servidores Samba e com controlador de domínio Active directory.
#Obs: Fiz algumas melhorias no código original e corrigi alguns bugs.
#Fonte: https://www.vivaolinux.com.br/script/Shell-Script-simples-usando-case/
#Publicado por Alexandre Pina (última atualização em 02/12/2013)
#Samba Policy Controls:http://www.linuxtopia.org/online_books/network_administration_guides/samba_reference_guide/18_passdb_15.html
#################################################################################################

clear
Menu(){
   echo "------------------------------------------"
   echo "             LinuxAdmin                   "
   echo "------------------------------------------"
   echo
   echo "[ 1 ] Novo Usuário"
   echo "[ 2 ] Nova Máquina"
   echo "[ 3 ] Listar usuários"
   echo "[ 4 ] Desbloquear usuário"
   echo "[ 5 ] Alterar senha do usuário"
   echo "[ 6 ] Instalar programa"
   echo "[ 7 ] Atualizar programas"
   echo "[ 8 ] Sair"
   echo
   echo -n "Digite a opcão desejada:   "
   read opcao;
   case $opcao in
      1) adicionar ;;
      2) computador ;;
      3) listar ;;
      4) desbloquear ;;
      5) alterar ;;
      6) instalar ;;
      7) atualizar ;;
      8) clear; echo "DESCONECTANDO DO SITEMA, AGUARDE..." ; sleep 3; clear; exit ;;
      *) echo "Opcão desconhecida." ; sleep 2; clear; Menu ;;
   esac
}

adicionar() {
echo "Digite o nome do usuário"
read usuario
echo "Qual grupo deseja adicioná-lo?"
read grupo
useradd -g usuarios -G $grupo -d /dev/null -s /bin/false $usuario
pdbedit -u $usuario -a -t <<EOF
suporte
suporte
EOF
net sam set pwdmustchangenow $usuario yes
echo "Usuário criado com sucesso! Sua senha é: suporte e deve ser alterada no primeiro acesso. O grupo adicionado foi: $grupo."
sleep 3; clear; Menu
}

#Função: Cria identificação do computador  para ser adicionado ao Active directory.
computador() {
echo "DIGITE O NOME DO computador A SER ADICIONADO"
read computer
useradd -d /dev/null -s /bin/false $computer$
passwd -l $computer$
smbpasswd -a -m $computer
echo "computador $computer adicionado com sucesso!"
sleep 3; clear; Menu
}

listar() {
  sudo pdbedit -L -v;
  sleep 5; Menu
}

desbloquear() {
echo "Digite o nome do usuário"
read usuario
pdbedit -c='[]' --user="$usuario"
pdbedit -v "$usuario"
echo "Usuário desbloqueado com sucesso!"
sleep 3; clear; Menu
}

alterar() {
echo "Digite o nome do usuário"
read usuario
sudo smbpasswd -a $usuario
sleep 3; clear; Menu
}

instalar() {
echo "Digite o nome do programa que deseja instalar"
read programa
apt-get install $programa
sleep 3; clear; Menu
}

atualizar() {
echo "Atualizando a lista de pacotes"
apt-get update && apt-get upgrade && apt-get autoremove
sleep 3; clear; Menu
}

echo "INICIANDO SISTEMA, AGUARDE..."; sleep 3; clear; Menu
