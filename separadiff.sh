#!/bin/bash

#Comparar 2 arquivos e mostrar os itens diferentes
#Publicado por andre (última atualização em 11/05/2015)
#Homepage: www.tinow.info
#https://www.vivaolinux.com.br/script/Comparar-2-arquivos-e-mostrar-os-itens-diferentes
#Basta passar os arquivos como parâmetros, ex.: bash separadiff.sh arq1 arq2

arq1=$1
arq2=$2

for x in `cat $arq1`
do
   diff=`cat $arq2 | grep -w "$x"`
   if [ "$diff" = "" ]
   then
      echo "$x"
   fi
done

