#!/bin/bash

#Esse script escreve uma mensagem no terminal.

# Tamanho
COLUNAS=$(tput cols)
LINHAS=$(tput lines)

SCRIPT="$(basename $0)"

# Verifica as dimensões da janela.
if [ $COLUNAS -lt 80 -o $LINHAS -lt 15 ]; then
	echo "$SCRIPT: ajuste o tamanho da janela."
	echo "Atual: ${COLUNAS}x${LINHAS}"
	echo 'Recomendado: 80x15'
	exit 1
fi

# Verifica se o 'pv' está instalado.
test $(which pv) || { echo "$SCRIPT: pacote 'pv' requerido."; exit 1; }	

# Reseta as configurações se o script for finalizado pelo usuário.
trap 'tput reset; trap - INT; exit' INT

clear


# Array contendo a mensagem.
MSG=(
'Mussum Ipsum, cacilds vidis litro abertis. \n'
'In elementis mé pra quem é amistosis quis leo. \n'
'Mais vale um bebadis conhecidiss, que um alcoolatra anonimis.\n'
'Nec orci ornare consequat. Praesent lacinia ultrices consectetur.\n'
'Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis. \n'
)


# Retorna a posição central da tela com base no número de caracteres
# na mensagem passada no parâmetro.
posx(){ echo $((($COLUNAS/2-1)-(${#1}/2))); }

# Oculta cursor
tput civis

# Lê os índices das mensagens
for i in $(seq 0 $((${#MSG[@]}-1)))
do
	# Centraliza o cursor
	#tput cup $((4+$i)) $(posx "${MSG[$i]}")
	# Imprime a mensagem em negrito, aplicando efeito de digitação com 'pv'
	echo -en "\033[1;37m${MSG[$i]}\033[0;m" | pv -qL 15
done

sleep 5

clear

#FIM
