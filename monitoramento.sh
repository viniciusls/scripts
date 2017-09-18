#!/bin/bash
#Monitorar espaço em discos

#NÃO ESTÁ CONCLUIDO, NÃO USE COMO EXEMPLO!

monitoramento () {

	SISTEMAS_MONITORADOS=$(df -h | sed "s/.*[0-9]%//g" | sed "s/^ //g" | grep "^/" | grep -v "//" )
	PORCENTAGEM_ALERTA=75
	# Colocar o e-mail que receberá o alerta de seguranca.
  EMAILS="email@email.com";

	for sistema_selecionado in $(echo "$SISTEMAS_MONITORADOS" |xargs); do
	uso_porcentagem=$(df "$sistema_selecionado" | grep "$sistema_selecionado" | grep -o "[0-9]\{1,3\}%" | sed 's/\%//')
	if test $uso_porcentagem -ge 75; then
	echo "Alerta de nivel critico do sistema de arquivos $sistema_selecionado com $uso_porcentagem% de uso." | mailx -s "Servidor $HOSTNAME com uso critico\
	de $sistema_selecionado" -r $USER $(echo $EMAILS)
	        fi
	done
}

monitoramento;
